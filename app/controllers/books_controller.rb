class BooksController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit, :edit, :update]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @chapters = Chapter.where(book_id: @book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :summary, :category, :user_id)
  end
end
