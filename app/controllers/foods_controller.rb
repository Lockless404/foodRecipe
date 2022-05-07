class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = Food.where(user_id: current_user.id)
  end

  def new; end

  def create; end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(current_user.id), notice: 'Food successfully deleted'
  end
end
