Rails.application.routes.draw do
  root 'paver_apps#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users, :paver_apps
end
