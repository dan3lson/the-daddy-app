# frozen_string_literal: true

class CreateWaitlistUser < ApplicationService
  attr_reader :email, :daddy_type, :referral_code

  def initialize(email:, daddy_type:, referral_code:)
    @email         = email
    @daddy_type    = daddy_type
    @referral_code = referral_code
  end

  def call
    waitlist_user = build_waitlist_user
    waitlist_user.save

    waitlist_user
  end

  private

  def build_waitlist_user
    waitlist_user =
      WaitlistUser
        .where(email: email)
        .first_or_initialize do |waitlist_user|
          waitlist_user.daddy_type = daddy_type
          waitlist_user.referrer   = referrer
        end
  end

  def referrer
    return if invalid_referral?

    WaitlistUser.find_by(referral_code: referral_code)
  end

  def invalid_referral?
    referral_code.nil? || waitlist_user_already_exists?
  end

  def waitlist_user_already_exists?
    WaitlistUser.exists?(email: email)
  end
end