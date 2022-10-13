# Stores waitlist email addresses and the type of daddy
# interested in joining the app. This is temporary.
class WaitlistUser < ApplicationRecord
  belongs_to :referrer, optional: true, class_name: :WaitlistUser
  has_many :referrals, foreign_key: :referrer_id, class_name: :WaitlistUser

  validates :daddy_type, presence: true
  validates :email,      presence: true
  validates :first_name, presence: true

  enum daddy_type: Lib::Constants::DADDY_TYPES

  before_create :set_referral_code

  private

  def set_referral_code
    loop do
      self.referral_code = SecureRandom.alphanumeric(6).upcase

      break unless WaitlistUser.exists?(referral_code: referral_code)
    end
  end
end
