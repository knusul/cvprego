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

    experience.attributes = experience_params
    experience.save
  end
end
