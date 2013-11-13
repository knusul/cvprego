class Experience < ActiveRecord::Base
  def parsed_to_date
    DateTime.parse(to_date).to_s rescue ""
  end
end
