class LanguagesController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :json
  # GET /languages.json
  private
  def permitted_params
    params.permit(:language => [:name, :level ])
  end
end
