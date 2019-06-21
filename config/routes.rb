<<<<<<< HEAD
Rails.application.routes.draw do 
=======
Rails.application.routes.draw do
>>>>>>> 05de29f5d70f6be66825cdce2a7b79fa97df5185
  #get 'group/index'
  #get 'group/new'
  #get 'group/edit'
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
  get '/index', to: 'workspaces#index'
  get '/home', to: 'static_pages#home'

  #get 'workspaces/delete'
  #get 'workspaces/show'
  #root 'static_pages#home'
  root 'workspaces#index'

  resources :workspaces

<<<<<<< HEAD
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
 # root 'group#index'
>>>>>>> 05de29f5d70f6be66825cdce2a7b79fa97df5185

  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
