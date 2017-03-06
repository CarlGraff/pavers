Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  resources :paver_apps, :users
  root 'paver_apps#index'

 end
