# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users do
    resources :general_shopping_list, only: [:index]
    resources :foods, only: %i[index create new destroy]
    resources :recipes, only: %i[index show create new destroy]
    resources :public_recipes, only: [:index]
  end
end
