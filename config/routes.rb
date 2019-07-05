
Rails.application.routes.draw do  

  devise_for :users
  root 'static_pages#home'
  get '/new', to: 'workspaces#new'
  get '/start', to: 'group#start'
  resources :workspaces
  resources :group  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
