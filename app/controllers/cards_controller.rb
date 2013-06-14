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
    params.require(:card).permit(:first_name, :last_name, :email, :contact_types)
  end

  def update_card(card)
    card_params = permitted_params
    contact_types_params = card_params.extract!(:contact_types)[:contact_types] || []
    Card.transaction do

      card.attributes = card_params
      card.save!
      # Update the contact's phone numbers, creating/destroying as appropriate.
      specified_contact_types = []
      contact_types_params.each do |contact_type_param|
        if contact_type_param[:id]
          ct = card.contact_types.find(contact_type_param[:id])
          ct.update_attributes(contact_type_param)
        else
          ct = card.contact_types.create(contact_type_param)
        end
        specified_contact_types << ct
      end
      card.contact_types.each do |ct|
        ct.destroy unless specified_contact_types.include? ct
      end
    end
    card.reload

    return true
  end
end
