class VotesController < ApplicationController
  def create
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

  def destroy
    unless Vote.find(vote_id).destroy
      redirect_back(fallback_location: meetings_url, notice: "fail!")
    end
    redirect_back(fallback_location: meetings_url, notice: "un-voated!")
  end

  private

  def book
    Book.find_by(book_params)
  end

  def session_id
    request.session_options.to_hash[:id].to_s
  end

  def book_params
    params.require(:book).permit(:id)
  end

  # TODO: something fishy with the way I'm handling this delete.
  # TODO: i should really just use the form helper stuff?
  def vote_id
    params.require(:id)
  end
end
