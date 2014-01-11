require "prawn"
Mime::Type.register "application/pdf", :pdf

# Adds a new renderer to ActionController.Renderers
ActionController::Renderers.add :pdf do |filename, options|
  pdf = Prawn::Document.new pdf.text render_to_string(options)
  send_data(pdf.render, :filename => "#{filename}.pdf",
      :type => "application/pdf", :disposition => "attachment")
end
