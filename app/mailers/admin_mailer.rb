# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  layout "mailer"
  default template_path: "mailers/#{name.underscore}"

  ADMIN_EMAIL = "admin@thedaddyapp.com"
  private_constant :ADMIN_EMAIL

  def alert(current_user_id:, message:, additional_data:, type:)
    @additional_data = additional_data
    @current_user = User.find_by(id: current_user_id)
    @message = message
    @type = type

    mail(to: ADMIN_EMAIL, subject: "New Alert [#{type}]")
  end

  def waitlist_user_joined(email:, first_name:, referral_code:)
    @email = email
    @first_name = first_name
    @referral_code = referral_code

    mail(to: @email, subject: "You're On The Waitlist!")
  end

  def reply(comment_id)
    comment = Comment.find(comment_id)
    @daddy = comment.parent.user

    mail(
      to: @daddy.email,
      subject: "Someone replied to your comment on The Daddy App"
    )
  end
end
