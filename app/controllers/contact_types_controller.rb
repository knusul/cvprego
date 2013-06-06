class ContactTypesController < ApplicationController
  # GET /contact_types.json
  def index
    render json: current_user.contact_types
  end

  # GET /contact_types/1.json
  def show
    contact_type = current_user.card.contact_types.find(params[:id])
    render json: contact_type
  end

  # POST /contact_types.json
  def create
    contact_type = current_user.card.contact_types.build
    if update_contact_type(contact_type)
      render json: contact_type, status: :created
    else
      render json: contact_type.errors, status: :unprocessable_entity
    end
  end

  # PUT /contact_types/1.json
  def update
    contact_type = current_user.contact_types.find(params[:id])
    if update_contact_type(contact_type)
      render json: contact_type, status: :ok
    else
      render json: contact_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_types/1.json
  def destroy
    contact_type = current_user.contact_types.find(params[:id])
    contact_type.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:contact_type).permit(:number, :name)
  end

  def update_contact_type(contact_type)
    contact_type_params = permitted_params
    contact_type.attributes = contact_type_params
    contact_type.save
  end
end
