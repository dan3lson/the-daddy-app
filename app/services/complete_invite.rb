# frozen_string_literal: true

# CompleteInvite marks an invite as :complete as
# soon as their guest signs up.
class CompleteInvite
  include Wisper::Publisher

  def call
    complete_invite
  end

  private

  attr_reader :email

  def initialize(email:)
    @email = email
  end

  def complete_invite
    invite = Invite.find_by(email: email)
    return unless invite

    invite.complete!
  end
end
