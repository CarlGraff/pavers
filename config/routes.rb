Rails.application.routes.draw do 
  root 'pavers#index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/purchase',  to: 'pavers#purchase'
  post '/purchase',  to: 'pavers#purchase_create'
  get  '/purchase_success',  to: 'pavers#purchase_success'
  get  '/purchase_cancel',  to: 'pavers#purchase_cancel'
  resources :users, :pavers
end
