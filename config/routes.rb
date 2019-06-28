Rails.application.routes.draw do  
  root 'static_pages#home'
  get '/new', to: 'workspaces#new'
  get '/login', to: 'static_pages#login'
  get '/home', to: 'static_pages#home'
  get '/menu', to: 'group#menu'
  get '/home', to: 'static_pages#home' 
  get '/signup', to: 'static_pages#signup'
  get '/index', to: 'workspaces#index'
  resources :workspaces


end
