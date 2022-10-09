class BooksController < ApplicationController
  def index
    @books = book.page(params[:page])
  end

  def show
    @books = book.find(params[:id])
  end

  def edit
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
