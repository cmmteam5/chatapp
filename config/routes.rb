Rails.application.routes.draw do

  root 'static_pages#home'
  get '/workspace', to:'static_pages#workspace'
  get '/signin', to:'static_pages#signin'


  #get 'create_group/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
