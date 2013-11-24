class VisitsController < InheritedResources::Base
  respond_to :json

  def create
    Visit.increase(permitted_params['visit']['email'])
    render :nothing => true
  end

  def index
    render :json => current_user.card.visits.from_last_week
  end

  private
  def permitted_params
    params.permit(:visit => [:email])
  end
end
