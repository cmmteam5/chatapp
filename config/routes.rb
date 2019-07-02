Rails.application.routes.draw do  
  root 'static_pages#home'
  get '/new', to: 'workspaces#new'
  get '/start', to: 'group#start'
  get '/search', to:'searchs#search'
  post '/search',to:'searchs#search'
  resources :workspaces
  resources :group  
  resources :user


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
