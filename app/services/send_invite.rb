# frozen_string_literal: true

# Emails a guest to join the app.
class SendInvite
  include Wisper::Publisher

  attr_reader :email, :user

  def initialize(email:, user: nil)
    @email = email&.strip
    @user = user
  end

  def call
    invite = Invite.create!(email: email, user: user)

    broadcast(:successful_invite, user, invite.email)

    invite
  rescue ActiveRecord::RecordInvalid => e
    broadcast(
      :alert,
      OpenStruct.new(
        additional_data: {invited_email: email},
        current_user_id: user.id,
        message: e.message,
        type: :error
      )
    )
  end
end
