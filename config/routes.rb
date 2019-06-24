Rails.application.routes.draw do
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
  
  get '/home', to: 'static_pages#home'
  #get '/menu', to: 'static_pages#menu'
  get '/signup', to: 'static_pages#signup'




  #get 'workspaces/delete'
  #get 'workspaces/show'
  #root 'static_pages#home'
  root 'workspaces#index'

  resources :workspaces

 # root 'group#index'

  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
