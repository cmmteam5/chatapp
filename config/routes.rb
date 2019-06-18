Rails.application.routes.draw do
  resources :workspaces
get '/edit', to:'workspace#edit'
get '/show', to:'workspace#show'
get '/index', to:'workspace#index'
get '/new', to:'workspace#new'
  # root 'static_pages#home'
  #get  '/already_workspace',   to: 'static_pages#already_workspace'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
