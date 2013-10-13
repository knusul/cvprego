class CardController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    if(params[:email])
      user = User.find_by_email(params[:email])
    else
      user = current_user
    end
    card = user.card
    render json: card
  end

  def update
    card = current_user.card
    if update_card(card)
      render json: card, status: :ok
    else
      render json: card.errors, status: :unprocessable_entity
    end
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
