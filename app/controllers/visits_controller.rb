class VisitsController < InheritedResources::Base
  respond_to :json

  def create
    location_params = request.location.data.slice("city", "country_name", "longitude", "latitude", 'ip')
    Visit.increase(permitted_params['visit']['email'], location_params)
    render :nothing => true
  end

  def index
    render json: current_user.card.visits.from_last_week
  end

  private
  def permitted_params
    params.permit(:visit => [:email])
  end
end
