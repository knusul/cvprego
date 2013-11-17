class HomeController < ApplicationController
  before_filter :find_user, only: :show
  def index;end

  def landing; end
  def show
    respond_to do |format|
      format.pdf {
        html = render_to_string(:layout => "pdf" , :action => "show.html.haml")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
        send_data(kit.to_pdf, :filename => "#{@user.card.first_name}_#{@user.card.last_name}.pdf", :type => 'application/pdf')
        return
      }
    end
  end

  private
  def find_user
    @user = User.find_by_email(params[:email])
    raise ActionController::RoutingError.new('Not Found') unless @user
    @card = @user.card
  end
end
