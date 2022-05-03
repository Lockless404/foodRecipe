Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "general_shopping_list#index"
  resources :users, do
    resources :general_shopping_lists, only: [:index]
    resources :foods, only: [:index, :create, :new, :destroy]
    resources :recipes, only: [:index, :show, :create, :new, :destroy]
    resources :public_recipes, only: [:index]
  end
end
