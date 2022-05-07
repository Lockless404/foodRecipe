class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
    redirect_to user_foods_path(@user)
  end
end
