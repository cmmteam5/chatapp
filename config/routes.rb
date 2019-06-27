Rails.application.routes.draw do
<<<<<<< HEAD
 
=======
  #get 'group/index'
  #get 'group/new'
 # get 'group/edit'
  #get 'group/show'
  #get 'workspaces/index'
  #get 'workspaces/new'
  #get 'workspaces/update'
 #get 'workspaces/delete'
 # get 'workspaces/show'
  root 'static_pages#home'
  #root 'workspaces#index'
  get '/new', to: 'workspaces#new'
  get '/login', to: 'static_pages#login'
  get '/home', to: 'static_pages#home'
  get '/menu', to: 'group#menu'
 # get '/index', to: 'group#index'
  get '/home', to: 'static_pages#home' 
  get '/signup', to: 'static_pages#signup'
  get '/index', to: 'workspaces#index'
  #get 'workspaces/delete'
  #get 'workspaces/show'
  #root 'static_pages#home'
  #root 'workspaces#index'
  resources :workspaces
 # root 'group#index'

  


>>>>>>> fef54ffa1db0850f8036f16f4762838a88fa1a37

 resources :workspaces
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
