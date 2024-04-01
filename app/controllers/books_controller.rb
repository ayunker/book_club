class BooksController < ApplicationController
  before_action :set_meeting, only: %i[new create]

  def new
    @book = @meeting.books.new
  end

  def create
    @book = @meeting.books.create!(book_params)

    respond_to do |format|
      format.html { redirect_to @meeting }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :slug, :author, :url)
  end

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
end
