Rails.application.routes.draw do  

  #scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

  root 'home#home'
  get  '/login',   to: 'session#new'
  post '/login',   to: 'session#create'
  delete'/logout',  to: 'session#destroy'
  get '/search', to:'search#search'
  post '/search',to:'search#search'

  resources :user
  resources :session
  resources :static_pages 
  resources :groupconversations  
 
  resources :workspaces do
  resources :userworkspace
  end
 
  resources :group  do
  resources :groupuser
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end

