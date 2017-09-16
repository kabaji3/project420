Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :members
  resources :groups
  resources :locations
  resources :users
  resources :configuration_dates
  post "users/valid_update" , as: 'users_valid_update', to: 'users#valid_update'

end
