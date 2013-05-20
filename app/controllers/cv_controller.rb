class CvController < ApplicationController
  before_filter :fetch_user

  def show
    binding.pry
  end
  private
  def fetch_user
    @user = User.find_by_email params[:email]
  end
end
