class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save!
    redirect_to book_path(book.id)
  end

  def index
     @books = Book.all
     @book = Book.new
     @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user= current_user
    @books = @user.books
  end

  def destroy
  end

  def edit
    @book = Book.find(params[:id])
  end

  def Update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@user.id)
  end


    private

  def book_params
     params.require(:book).permit(:title, :body , :user_id)
  end

end
