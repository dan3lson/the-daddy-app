# frozen_string_literal: true

# InviteListener patiently waits to launch
# actions on behalf of invites.
class InviteListener
  def complete_invite(email)
    CompleteInvite.new(email: email).call
  end
end
