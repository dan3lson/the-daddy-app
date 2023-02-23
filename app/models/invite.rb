# frozen_string_literal

# TODO: rename model to Referral
class Invite < ApplicationRecord
  # TODO: make polymorphic so it can belong to a User, WaitlistUser, or Guest.
  # Guest would be like a null object.
  # TODO: add unique code so URL can be generated -- look into Munchkin app
  belongs_to :user, optional: true

  validates :email, presence: true, uniqueness: {
    message: "has already been invited"
  }
  validates :status, presence: true

  before_save :downcase_email

  enum status: {pending: 0, complete: 1}

  private

  def downcase_email
    self.email = email.strip.downcase
  end
end
