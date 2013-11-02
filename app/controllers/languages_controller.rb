class LanguagesController < ResourceController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json

  private
  def permitted_params
    params.permit(:language => [:name, :level ])
  end
end
