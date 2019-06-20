Rails.application.routes.draw do
  
  root 'workspaces#index'
  get "/workspaces",to:"workspace#index"
  get "/destroy/:id",to:"workspace#destroy"
  get "workspaces/:id/edit",to:"workspace#edit"
  post "workspaces/",to:"workspace#update"
  get "workspaces/new",to:"workspace#new"
  post "workspaces/new",to:"workspace#create"
  resources :workspaces 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
