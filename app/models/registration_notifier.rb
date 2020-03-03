# frozen_string_literal: true

# Class to listen and trigger registration-related events
class RegistrationListener
  def registration_successful(daddy_id)
    daddy = Daddy.find(daddy_id)

    UserMailer.welcome(daddy.email).deliver_later
  end
end