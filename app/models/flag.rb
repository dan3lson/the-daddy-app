# frozen_string_literal: true

class Flag < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :comment,
    presence: true,
    uniqueness: {
      scope: %i[user_id],
      message: "User can only flag a comment once"
    }
end
