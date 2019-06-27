<<<<<<< HEAD

Rails.application.routes.draw do 

=======
Rails.application.routes.draw do
<<<<<<< HEAD
 
=======
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
  #get 'group/index'
  #get 'group/new'
  #get 'group/edit'
  #get 'group/show'
<<<<<<< HEAD
 # root 'static_pages#home'
=======
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

>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
  
  #root 'workspaces#index'
 #get '/new', to: 'group#new'
  #get '/login', to: 'static_pages#login'
 # get '/home', to: 'static_pages#home'
 #get '/index', to: 'workspaces#index'
  #get '/login', to: 'static_pages#login'
 # get '/home', to: 'static_pages#home'
 #resources :workspaces
 root 'group#index'

resources :group
 

<<<<<<< HEAD
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

=======
>>>>>>> fef54ffa1db0850f8036f16f4762838a88fa1a37

 resources :workspaces
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> fa35f9f285bf7eb9f47aa8a0e5de6941365353d5
end
