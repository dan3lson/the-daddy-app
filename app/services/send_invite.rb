# frozen_string_literal: true

# SendInvite emails a guest to join the daddy app.
class SendInvite
  include Wisper::Publisher

  def call
    send_invite
  end

  private

  attr_reader :user, :guest_email

  def initialize(guest_email:, user: nil)
    @user = user
    @guest_email = guest_email
  end

  def send_invite
    invite = build_invite

    broadcast(:successful_invite, user, guest_email) if invite.save

    invite
  end

  def build_invite
    invite = Invite.new
    invite.email = guest_email
    invite.user = user

    invite
  end
end
