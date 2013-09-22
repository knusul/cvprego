class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_card
  # attr_accessible :title, :body
  has_one :card
  has_many :experiences
  has_many :educations
  has_many :skills
  has_many :languages
  has_many :hobbies
end
