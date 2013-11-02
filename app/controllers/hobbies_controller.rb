class HobbiesController < ResourceController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

  def permitted_params
    params.permit(:hobby => [:name])
  end
end
