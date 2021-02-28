# frozen_string_literal: true

# Model to represent a baby.
class Baby < ApplicationRecord
  belongs_to :daddy, class_name: :User, foreign_key: :user_id

  validates :first_name, presence: true
  validates :gender, presence: true
  validates :birthdate, presence: true

  enum gender: { male: 0, female: 1 }

  def humanize_gender
    male? ? 'boy' : 'girl'
  end
end
