Rails.application.routes.draw do
<<<<<<< HEAD
  resources :workspaces
get '/edit', to:'workspace#edit'
get '/show', to:'workspace#show'
get '/index', to:'workspace#index'
get '/new', to:'workspace#new'
  # root 'static_pages#home'
  #get  '/already_workspace',   to: 'static_pages#already_workspace'
=======

  root 'static_pages#home'
 


  #get 'create_group/new'

>>>>>>> 6ae8ed208052bc24ef7c850dd9f3ed1bb5f81595
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
