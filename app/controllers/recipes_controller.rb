class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @food = @recipe.recipe_foods.includes(:food)
  end

  def new; end

  def create; end

  def destroy; end
end
