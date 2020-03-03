# frozen_string_literal: true

# Model to categorize comments
class Topic < ApplicationRecord
  # Relationships
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
