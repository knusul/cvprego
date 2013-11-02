class EducationsController < ResourceController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

private
  def permitted_params
    params.permit(:education => [:from_date, :to_date, :name])
  end
end
