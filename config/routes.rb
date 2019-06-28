
Rails.application.routes.draw do

  root 'group#index'

  resources :group
   

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
