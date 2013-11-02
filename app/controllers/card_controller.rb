class CardController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    if(params[:email])
      user = User.find_by_email(params[:email])
    else
      user = current_user
    end
    raise ActiveRecord::RecordNotFound unless user
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
    params.require(:card).permit(:first_name, :last_name, :email, :contact_types => [:number, :name])
  end

  def update_card(card)
    card_params = permitted_params.except :contact_types
    card_params[:contact_types_attributes] = permitted_params[:contact_types] if permitted_params[:contact_types]
    if card_params
    Card.transaction do
      card.contact_types.delete_all
      card.attributes = card_params
      card.save!
     end
    end
  end
end
