class ResourceController < InheritedResources::Base

  private
  def begin_of_association_chain
    current_user || User.find_by_email(params[:email]) || raise( ActiveRecord::RecordNotFound )
  end
end
