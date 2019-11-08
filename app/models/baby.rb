class Baby < ApplicationRecord
	# Relationships
	belongs_to :daddy, class_name: :User, foreign_key: :user_id

	# Validations
	validates :first_name, presence: true
	validates :gender,		 presence: true
	validates :birthdate,  presence: true

	# Enums
	enum gender: { male: 0, female: 1 }
end
