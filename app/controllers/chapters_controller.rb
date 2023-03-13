class ChaptersController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update]

  def show
    @chapter = Chapter.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @book = Book.find(params[:book_id])
    @chapter.book = @book
    if @chapter.save
      redirect_to book_path(@book), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :content, :notice)
  end
end
