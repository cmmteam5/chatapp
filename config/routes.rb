<<<<<<< HEAD
=======

>>>>>>> 848e817923bc1f68e307cecdf538a1f296a3862b

Rails.application.routes.draw do  

  devise_for :users
  root 'static_pages#home'
  get '/new', to: 'workspaces#new'
  get '/start', to: 'group#start'
  get '/search', to:'searchs#search'
  post '/search',to:'searchs#search'
  resources :workspaces
  resources :group  
  resources :user



<<<<<<< HEAD

=======
>>>>>>> 848e817923bc1f68e307cecdf538a1f296a3862b
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
