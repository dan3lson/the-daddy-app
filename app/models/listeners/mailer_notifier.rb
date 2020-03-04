# frozen_string_literal: true

module Listeners
  # Listens for email notifications
  class MailerNotifier
    def registration_successful(email)
      UserMailer.welcome(email).deliver_later
    end
  end
end