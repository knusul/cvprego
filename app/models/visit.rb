class Visit < ActiveRecord::Base
  has_many :locations, :dependent => :destroy
  scope :from_today, -> {where(:date => Date.today)}
  scope :from_last_week, -> {where("date > ?", 7.days.ago )}

  def self.increase(email, location)
    User.find_by_email(email).tap do |user|
      user.card.visits.from_today.first_or_create.tap do |visit|
        visit.count = visit.count + 1
        visit.date = Date.today
        visit.locations.create(location)
      end.save
    end
  end
end
