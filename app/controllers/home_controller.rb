class HomeController < ApplicationController
  before_filter :find_user, only: :show
  def index;end

  def landing; end
  def show
      html = render_to_string(:layout => "pdf" , :action => "show.html.haml")
      kit = PDFKit.new(html)
      kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
      send_data(kit.to_pdf, :filename => "some_name.pdf", :type => 'application/pdf')
  end

  private
  def find_user
    @user = User.find_by_email(params[:email])
    @card = @user.card
  end
end
