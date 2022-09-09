# Stores waitlist email addresses and the type of daddy
# interested in joining the app. This is temporary.
class WaitlistUser < ApplicationRecord
  validates :daddy_type, presence: true
  validates :email,      presence: true

  enum daddy_type: Lib::Constants::DADDY_TYPES
end
