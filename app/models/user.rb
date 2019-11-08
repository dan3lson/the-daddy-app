class User < ApplicationRecord
  include Clearance::User

  # Relationships
  has_many :babies,   dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
	validates :email,      presence: true, uniqueness: { case_sensitive: false }
	validates :password,   presence: true
	validates :first_name, presence: true
	validates :city, 			 presence: true
end
