class Visit < ActiveRecord::Base
  scope :from_today, -> {where(:date => Date.today)}
  scope :from_last_week, -> {where("date > ?", 7.days.ago )}

  def self.increase(email)
    card = Card.find_by_email(email)
    card.visits.from_today.first_or_create.tap do |visit|
      visit.count = visit.count + 1
      visit.date = Date.today
    end.save
  end
end
