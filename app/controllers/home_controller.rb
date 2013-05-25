class HomeController < ApplicationController
  before_filter :find_user, only: :show
  def index; end
  def landing; end
  def show; end

  private
  def find_user
    @user = User.find_by_email(params[:email])
    @card = @user.card
  end
end
