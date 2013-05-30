class UploadsController < ApplicationController
  before_filter :authenticate_user!

  def create
    card = current_user.card
    card.photo = params[:files].first
    if card.save
      render json: {filename: card.photo.identifier, url: card.photo.url, status: 200 }
    else
      render json: { errors: card.errors.full_messages }
    end
  end
end
