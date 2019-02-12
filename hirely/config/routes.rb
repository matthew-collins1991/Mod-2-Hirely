Rails.application.routes.draw do

  root 'mains#index'
get    '/signup',  to: 'users#new'
get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
resources :item_reviews
resources :hires
resources :items
resources :users
get 'main_menu', to: 'mains#main_menu', as: 'menu'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
