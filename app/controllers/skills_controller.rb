class SkillsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :json

  private
  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(:skill => [:name])
  end
end
