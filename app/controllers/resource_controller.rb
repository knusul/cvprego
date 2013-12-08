class ResourceController < InheritedResources::Base

  private
  def begin_of_association_chain
    user = if params[:email]
             User.find_by_email(params[:email])
           else
             current_user
           end
    user ||  raise( ActiveRecord::RecordNotFound )
  end
end
