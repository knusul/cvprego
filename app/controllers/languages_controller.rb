class LanguagesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index]
  respond_to :json
  private

  def begin_of_association_chain
    current_user || User.find_by_email(params[:email])
  end

  def permitted_params
    params.permit(:language => [:name, :level ])
  end
end
