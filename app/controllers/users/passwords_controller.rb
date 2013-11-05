class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  private :resource_params

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    authenticated_root_url
  end
end
