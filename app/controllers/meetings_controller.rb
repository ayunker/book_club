class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show]

  def show
  end

  def current
    @meeting = Meeting.order(id: :desc).first
    redirect_to @meeting
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
