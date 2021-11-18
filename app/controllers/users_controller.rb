class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @books= Book.all
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image_id)
  end
end
