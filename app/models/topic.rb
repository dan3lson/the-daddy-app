class Topic < ApplicationRecord
	# Relationships
	has_many :comments, dependent: :destroy

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
