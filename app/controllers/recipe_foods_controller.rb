class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.food
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(params.require(:recipe_food).permit(:food_id, :quantity))
    respond_to do |format|
      format.html do
        if @recipe_food.save
          redirect_to [@recipe.user, @recipe], notice: 'Food added successfully'
        else
          flash.now[:error] = 'Error:  Food could not be added'
          render :new, locals: { recipe_food: @recipe_food }
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = RecipeFood.find(params[:id])
    @recipe.destroy
    flash[:success] = 'ingredient deleted successfully.'
    redirect_to user_recipe_path(@recipe.recipe_id)
  end

  private

  def update_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
