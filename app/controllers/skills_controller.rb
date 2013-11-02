class SkillsController < ResourceController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

  private 
  def permitted_params
    params.permit(:skill => [:name])
  end
end
