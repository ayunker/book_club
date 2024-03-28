class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show]

  def show
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
