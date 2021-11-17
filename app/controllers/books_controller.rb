class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path
  end

  def index
     @books = Book.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

    private

  def book_params
    permit(:title, :body, :user_id)
  end

end
