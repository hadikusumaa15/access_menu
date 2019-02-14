class User < ApplicationRecord
  before_create :confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        #  , :confirmable, :registerable
        has_and_belongs_to_many :hotels
        has_one :role
        has_many :hotels_users

  # belongs_to :role

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
def email_active
  self.email_confirmed = true
  self.confirm_token = nil

  save!(:validate => false)
end
end