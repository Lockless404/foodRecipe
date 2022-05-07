class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = current_user.recipe

    total_items(@recipes)
    total_value(@recipes)
  end

  def total_items(recipes)
    @food = 0
    recipes.map do |recipe|
      0 unless recipe.foods.any?
      @food += recipe.foods.distinct.count(:id)
    end
    @food
  end

  def total_value(recipes)
    @value = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |food|
        @value += food.food.price * food.quantity
      end
    end
    @value
  end
end
