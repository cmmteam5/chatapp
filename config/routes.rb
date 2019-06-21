Rails.application.routes.draw do
  #get 'group/index'
  #get 'group/new'
 # get 'group/edit'
  #get 'group/show'
  #get 'workspaces/index'
  #get 'workspaces/new'
  #get 'workspaces/update'
  #get 'workspaces/delete'
  #get 'workspaces/show'
  #root 'static_pages#home'
  root 'workspaces#index'
  resources :workspaces

 # root 'group#index'

  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
