class ExperiencesController < ApplicationController
  # GET /experiences.json
  def index
    render json: current_user.experiences
  end

  # GET /experiences/1.json
  def show
    experience = current_user.experiences.find(params[:id])
    render json: experience
  end

  # POST /experiences.json
  def create
    experience = current_user.experiences.build
    if update_experience(experience)
      render json: experience, status: :created
    else
      render json: experience.errors, status: :unprocessable_entity
    end
  end

  # PUT /experiences/1.json
  def update
    experience = current_user.experiences.find(params[:id])
    if update_experience(experience)
      render json: experience, status: :ok
    else
      render json: experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /experiences/1.json
  def destroy
    experience = current_user.experiences.find(params[:id])
    experience.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:experience).permit(:from_date,
                                    :to_date,
                                    :email,
                                    :description,
                                    :role,
                                    :tittle,
                                    )
  end

  def update_experience(experience)
    experience_params = permitted_params
    experience.attributes = experience_params
    experience.save
  end
end
