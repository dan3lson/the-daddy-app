# frozen_string_literal: true

class CreateWaitlistUser < ApplicationService
  include Wisper::Publisher

  attr_reader :email, :daddy_type, :first_name, :referral_code

  def initialize(email:, daddy_type:, first_name:, referral_code:)
    @email         = email
    @daddy_type    = daddy_type
    @first_name    = first_name
    @referral_code = referral_code
  end

  def call
    waitlist_user = build_waitlist_user
    waitlist_user.save
    send_email(waitlist_user)

    waitlist_user
  end

  private

  def build_waitlist_user
    WaitlistUser
      .where(email: email)
      .first_or_initialize do |waitlist_user|
        waitlist_user.daddy_type = daddy_type
        waitlist_user.first_name = first_name
        waitlist_user.referrer   = referrer
      end
  end

  def referrer
    return if invalid_referral?

    WaitlistUser.default_scoped.find_by(referral_code: referral_code)
  end

  def invalid_referral?
    referral_code.blank? || waitlist_user_already_exists?
  end

  def waitlist_user_already_exists?
    WaitlistUser.default_scoped.exists?(email: email)
  end

  def send_email(waitlist_user)
    return unless waitlist_user_already_exists? || waitlist_user.persisted?

    broadcast(:successful_waitlist_user_joined, waitlist_user)
  end
end
