class PublicRecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.includes(:user).where(public: true)
  end
end
