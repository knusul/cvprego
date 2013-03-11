class CardsController < ApplicationController

  # GET /cards/1.json
  def show
    card = Card.find(params[:id])
    render json: card
  end

  # POST /cards.json
  def create
    card = Card.new
    if update_card(card)
      render json: card, status: :created
    else
      render json: card.errors, status: :unprocessable_entity
    end
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
    card_paras = permitted_params
    card.attributes = permitted_params
  end
end
