class EducationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /educations.json
  def index
    render json: current_user.educations
  end

  # GET /educations/1.json
  def show
    educations = current_user.educations.find(params[:id])
    render json: educations
  end

  # POST /educations.json
  def create
    educations = current_user.educations.build
    if update_educations(educations)
      render json: educations, status: :created
    else
      render json: educations.errors, status: :unprocesable_entity
    end
  end

  # PUT /educations/1.json
  def update
    educations = current_user.educations.find(params[:id])
    if update_educations(educations)
      render json: educations, status: :ok
    else
      render json: educations.errors, status: :unprocesable_entity
    end
  end

  # DELETE /educations/1.json
  def destroy
    educations = current_user.educations.find(params[:id])
    educations.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:education).permit(:from_date,
                                    :to_date,
                                    :name,
                                    )
  end

  def update_educations(educations)
    educations_params = permitted_params
    educations.attributes = educations_params
    educations.save
  end
end
