# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  layout "mailer"
  default template_path: "mailers/#{name.underscore}"

  ADMIN_EMAIL = "admin@thedaddyapp.com"
  private_constant :ADMIN_EMAIL

  def alert(current_user_id:, message:, type:, additional_data: {})
    @additional_data = additional_data
    @current_user = User.find_by(id: current_user_id)
    @message = message
    @type = type

    mail(to: ADMIN_EMAIL, subject: "New Alert [#{type}]")
  end
end
