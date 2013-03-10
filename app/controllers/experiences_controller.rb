class ExperiencesController < ApplicationController
  # GET /experiences.json
  def index
    render json: Experience.all
  end

  # GET /experiences/1.json
  def show
    experience = Experience.find(params[:id])
    render json: experience
  end

  # POST /experiences.json
  def create
    experience = Experience.new
    if update_experience(experience)
      render json: experience, status: :created
    else
      render json: experience.errors, status: :unprocessable_entity
    end
  end

  # PUT /experiences/1.json
  def update
    experience = Experience.find(params[:id])
    if update_experience(experience)
      render json: experience, status: :ok
    else
      render json: experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1.json
  def destroy
    experience = Experience.find(params[:id])
    experience.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:experience).permit(:from_date,
                                    :to_date,
                                    :email,
                                    :notes,
                                    :contact_types)
  end

  def update_experience(experience)
    experience_params = permitted_params
    contact_types_param = experience_params.extract!(:contact_types)
    contact_types_param = contact_types_param[:contact_types]
    contact_types_param ||= []

    # Because updates to the experience and its associations should be atomic,
    # wrap them in a transaction.
    Experience.transaction do
      # Update the experience's own attributes first.
      experience.attributes = experience_params
      experience.save!

      # Update the experience's phone numbers, creating/destroying as appropriate.
      specified_contact_types = []
      contact_types_param.each do |contact_type_params|
        if contact_type_params[:id]
          pn = experience.contact_types.find(contact_type_params[:id])
          pn.update_attributes(contact_type_params)
        else
          pn = experience.contact_types.create(contact_type_params)
        end
        specified_contact_types << pn
      end
      experience.contact_types.each do |pn|
        pn.destroy unless specified_contact_types.include?(pn)
      end
    end

    # Important! Reload the experience to ensure that changes to its associations
    # (i.e. phone numbers) will be serialized correctly.
    experience.reload

    return true
  rescue
    return false
  end
end
