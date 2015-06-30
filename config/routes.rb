Rails.application.routes.draw do
  root to: 'maps#index'

  post :explore, to: 'maps#explore'
end
