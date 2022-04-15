Rails.application.routes.draw do
  post 'users/set_current_user', to: 'users#set_current_user', as: 'set_current_user'

  resources :artworks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "artworks#index"
end
