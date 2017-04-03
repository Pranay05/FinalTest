Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html






#place mdel routing
post 'add_place', to: 'places#create'
post 'show_place', to: 'places#show'








#user model routing
post 'otherprofile', to: 'users#show_other_profile'
post 'home' , to: 'users#home'
post 'signin', to: 'sessions#create'
post 'edit_profile', to: 'users#update'
post 'myprofile', to: 'users#show'
resources :users




end
