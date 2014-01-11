class HomeController < ApplicationController
  before_filter :ensure_pdf_format, only: :show
  before_filter :find_user, only: :show
  def index;end

  def landing; end
  def show
    respond_to do |format|
      format.pdf {
        user_pdf = CvPdf.new user: @user
        send_data user_pdf.render, filename: "#{user_pdf.filename}", type: "application/pdf"
      }
    end
  end

  private
  def ensure_pdf_format
    render :nothing => true, :status => 406 unless params[:format] == 'pdf'
  end

  def find_user
    @user = User.find_by_email(params[:email])
    raise ActionController::RoutingError.new('User not Found') unless @user
    @card = @user.card
  end
end
