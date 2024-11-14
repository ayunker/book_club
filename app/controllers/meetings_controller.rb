class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show update]

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.create!(meeting_params)

    redirect_to meeting_path(@meeting, edit: true)
  end

  def show
    @edit_mode = true if params[:edit]
  end

  def update
    @meeting.toggle_lock!
  end

  def current
    @meeting = Meeting.order(id: :desc).first
    redirect_to @meeting
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
