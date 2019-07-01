<<<<<<< HEAD
Rails.application.routes.draw do
 
 get    '/search',   to: 'workspaces#search'
 post    '/search',   to: 'workspaces#search'
 resources :workspaces
 
=======

Rails.application.routes.draw do  
  root 'static_pages#home'
  get '/new', to: 'workspaces#new'
  get '/start', to: 'group#start'
  resources :workspaces
  resources :group  

>>>>>>> 0bb737eadc9477c6f7a969d69685be7696993344
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
