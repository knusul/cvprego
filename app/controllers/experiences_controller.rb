class ExperiencesController < ResourceController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

  private
  def permitted_params
    params.permit(:experience => [:from_date,
          :to_date, :email, :description, :role, :company_name])
  end
end
