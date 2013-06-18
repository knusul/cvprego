class CardsController < ApplicationController
  before_filter :authenticate_user!
  # GET /cards/1.json
  def show
    card = current_user.card
    render json: card
  end

  # PUT /cards/1.json
  def update
    card = Card.find(params[:id])
    if update_card(card)
      render json: card, status: :ok
    else
      render json: card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1.json
  def destroy
    card = Card.find(params[:id])
    card.destroy
    render json: nil, status: :ok
  end

  def permitted_params
    params.require(:card).permit(:first_name, :last_name, :email)
  end

  def update_card(card)
    card_params = permitted_params
    Card.transaction do
      card.attributes = card_params
      card.save!
     end
  end
end
