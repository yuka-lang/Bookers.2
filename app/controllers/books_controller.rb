class BooksController < ApplicationController
  before_action :current_user, only: [:edit]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
   if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully."
   else
     @books = Book.all
     render:index
   end
  end

  def index
     @books = Book.all
     @book = Book.new
     @user = current_user
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
   end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "You have updated user successfully."
    else
        render :edit
    end
  end


    private

  def book_params
     params.require(:book).permit(:title, :body , :user_id)
  end

end
