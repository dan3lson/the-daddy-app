class Baby < ApplicationRecord
	# Relationships
	belongs_to :user

	# Validations
	validates :name, 			presence: true
	validates :gender,		presence: true
	validates :birthdate, presence: true
end
