Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :members
  resources :locations
  resources :users
end
