# frozen_string_literal

# Invite model to represent invitations.
class Invite < ApplicationRecord
  belongs_to :user, optional: true

  validates :email,  presence: true, uniqueness: {
    message: 'has already been invited'
  }
  validates :status, presence: true

  enum status: { pending: 0, complete: 1 }
end
