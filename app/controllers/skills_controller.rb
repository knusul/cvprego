class SkillsController < ApplicationController
  before_filter :authenticate_user!

  def index
    render json: current_user.skills
  end

  def show
    skill = current_user.skills.find(params[:id])
    render json: skill
  end

  def create
    skill = current_user.skills.build
    if update_skill(skill)
      render json: skill, status: :created
    else
      render json: skill.errors, status: :unprocesable_entity
    end
  end

  # PUT /skills/1.json
  def update
    skill = current_user.skills.find(params[:id])
    if update_skill(skill)
      render json: skill, status: :ok
    else
      render json: skill.errors, status: :unprocesable_entity
    end
  end

  # DELETE /skills/1.json
  def destroy
    skill = current_user.skills.find(params[:id])
    skill.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:skill).permit(:name)
  end

  def update_skill(skill)
    skill_params = permitted_params
    skill.attributes = skill_params
    skill.save
  end
end
