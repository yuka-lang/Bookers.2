class BooksController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
     @books = Book.all
  end

  def show
  end

  def destroy
  end
  
    private

  def post_image_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end
