# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  resources :users do
    resources :general_shopping_list, only: [:index]
    resources :foods, only: %i[index create new destroy]
    resources :recipes do
      resources :recipe_foods, only: %i[create new destroy]
    end
    resources :public_recipes, only: [:index]
  end
  root 'public_recipes#index'
end
