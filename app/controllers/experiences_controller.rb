class ExperiencesController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :json

  private

  def permitted_params
    params.permit(:experience => [:from_date,
          :to_date, :email, :description, :role, :company_name])
  end
end
