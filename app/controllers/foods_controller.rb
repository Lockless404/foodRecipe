class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = Food.where(user_id: current_user.id)
  end

  def new; end

  def create; end

  def destroy; end
end
