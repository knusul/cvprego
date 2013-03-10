class Experience < ActiveRecord::Base
  validates :from_date, :presence => true
  validates :to_date, :presence => true
  has_many :contact_types, :dependent => :destroy

  def full_name
    self.from_date + ' ' + self.to_date
  end
end
