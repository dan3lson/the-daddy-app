# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_many :babies,   dependent: :destroy
  has_many :comments, dependent: :destroy

	validates :email,      presence: true, uniqueness: { case_sensitive: false }
	validates :password,   presence: true
	validates :first_name, presence: true
	validates :city, 			 presence: true
end
