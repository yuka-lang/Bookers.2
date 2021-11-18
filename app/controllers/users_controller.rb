class UsersController < ApplicationController
  def show
  end

  def index
    @books= Book.all
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image_id)
  end
end
