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
    params.require(:experience).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :notes,
                                    :phone_numbers)
  end

  def update_experience(experience)
    experience_params = permitted_params
    phone_numbers_param = experience_params.extract!(:phone_numbers)
    phone_numbers_param = phone_numbers_param[:phone_numbers]
    phone_numbers_param ||= []

    # Because updates to the experience and its associations should be atomic,
    # wrap them in a transaction.
    Experience.transaction do
      # Update the experience's own attributes first.
      experience.attributes = experience_params
      experience.save!

      # Update the experience's phone numbers, creating/destroying as appropriate.
      specified_phone_numbers = []
      phone_numbers_param.each do |phone_number_params|
        if phone_number_params[:id]
          pn = experience.phone_numbers.find(phone_number_params[:id])
          pn.update_attributes(phone_number_params)
        else
          pn = experience.phone_numbers.create(phone_number_params)
        end
        specified_phone_numbers << pn
      end
      experience.phone_numbers.each do |pn|
        pn.destroy unless specified_phone_numbers.include?(pn)
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
