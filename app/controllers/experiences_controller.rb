class ExperiencesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

  private

  def begin_of_association_chain
    current_user || User.find_by_email(params['email'])
  end

  def permitted_params
    params.permit(:experience => [:from_date,
          :to_date, :email, :description, :role, :company_name])
  end
end
