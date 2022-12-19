class ChaptersController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit]

  def index
    @chapters = Chapter.where()
  end

  def show
    @chapter = chapter.find(params[:id])
  end

  def new
    @chapter = chapter.new
  end

  def create
    @chapter = chapter.new(chapter_params)
    @chapter.user = current_user
    if @chapter.save
      redirect_to chapter_path(@chapter), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def chapter_params
    params.require(:chapter).permit(:title, :content, :notice, :book_id)
  end
end
