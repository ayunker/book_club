class VotesController < ApplicationController
  def create
    book = Book.find_by(book_params)

    if book
      Vote.find_or_create_by(
        book:,
        user_ref: session_id
      )
    else
      redirect_back(fallback_location: meetings_url, notice: "fail!")
    end
    redirect_back(fallback_location: meetings_url, notice: "voated!")
  end

  private

  def session_id
    request.session_options.to_hash[:id].to_s
  end

  def book_params
    params.require(:book).permit(:id)
  end
end
