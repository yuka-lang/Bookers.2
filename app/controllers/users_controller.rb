class UsersController < ApplicationController
 before_action :ensure_current_user, only: [:edit]

   def ensure_current_user
      @user = User.find(params[:id])
      if current_user != User.find_by(id: @user.id)
          redirect_to user_path(@user.id)
      end
   end


  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id:@user.id)
    @book = Book.new
  end


  def index
    @books= Book.all
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
    render :edit
    end
  end


 private
  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end
end
