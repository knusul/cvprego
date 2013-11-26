class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :card, :dependent => :destroy
  has_many :experiences, :dependent => :destroy 
  has_many :educations, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :languages, :dependent => :destroy
  has_many :hobbies, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  after_create :create_card

  private
  def create_card
    self.card = Card.create :email => self.email
  end
end
