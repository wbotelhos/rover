set :application         , 'estacione'
set :branch              , ENV.fetch('branch', 'master')
set :database_file       , "#{deploy_to}/config/database.yml"
set :log_level           , :warn
set :repo_url            , 'git@github.com:wbotelhos/rover'
set :secrets_file        , "#{current_path}/config/secrets.yml"
set :unicorn_file        , "#{deploy_to}/config/unicorn.rb"
set :unicorn_pid_file    , '/var/run/unicorn/unicorn.pid'
set :unicorn_socket_file , '/var/run/unicorn/.unicorn.sock'

namespace :config do
  task :database do
    on roles :app do
      info ': Linking database.yml...'

      path = 'config/database.yml'
      from = "#{deploy_to}/#{path}"
      to   = "#{current_path}/#{path}"

      execute :ln, '-nfs', from, to
    end
  end

  task :secrets do
    on roles :app do
      info ': Creating secrets.yml...'

      key = `bundle exec rake secret`.gsub(/\n/, '')

      execute %(echo 'production:' > #{fetch(:secrets_file)} && echo "  secret_key_base: #{key}" >> #{fetch(:secrets_file)})
    end
  end
end

namespace :unicorn do
  task :restart do
    on roles :app do
      invoke 'unicorn:stop'
      invoke 'unicorn:start'
    end
  end

  task :start do
    on roles :app do
      within current_path do
        if test unicorn_pid_exist?
          info ': Unicorn PID file exist...'

          if unicorn_running?
            info ': Unicorn is already running.'
          else
            with rails_env: fetch(:rails_env) do
              execute :bundle, 'exec unicorn_rails', '-c', fetch(:unicorn_file), '-D'
            end
          end
        else
          info ': Unicorn starting...'

          with rails_env: fetch(:rails_env) do
            execute :bundle, 'exec unicorn_rails', '-c', fetch(:unicorn_file), '-D'
          end
        end
      end
    end
  end

  task :stop do
    on roles :app do
      within current_path do
        if test unicorn_pid_exist?
          info ': Unicorn PID file exist...'

          if test unicorn_running?
            info ': Unicorn stopping...'
            execute :kill, unicorn_pid

            if test unicorn_socket_exist?
              warn ': Removing Unicorn dead socket file...'

              execute :rm, fetch(:unicorn_socket_file)
            end
          else
            info ': Unicorn PID was dead. Removing it...'
            execute :rm, fetch(:unicorn_pid_file)
          end
        else
          info ': Unicorn is already stopped.'
        end
      end
    end
  end
end

after 'deploy:finished', 'unicorn:restart'

def unicorn_pid
  "`cat #{fetch(:unicorn_pid_file)}`"
end

def unicorn_pid_exist?
  "[ -e #{fetch(:unicorn_pid_file)} ]"
end

def unicorn_socket_exist?
  "[ -e #{fetch(:unicorn_socket_file)} ]"
end

def unicorn_running?
  "kill -0 #{unicorn_pid}"
end
