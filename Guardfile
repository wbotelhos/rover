guard :rspec, all_after_pass: false, all_on_start: false, cmd: 'spring rspec' do
  watch %r{^app/(.+)\.rb$} do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch(%r{^spec\/.+_spec\.rb$})
end
