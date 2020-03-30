# frozen_string_literal: true

# MailerListener patiently waits to send email notifications.
class MailerListener
  def successful_registration(email)
    UserMailer.welcome(email).deliver_later
  end

  def successful_reply(comment_id)
    UserMailer.reply(comment_id).deliver_later
  end

  def successful_invite(daddy, invitee_email)
    UserMailer.
      invite(inviter_email: daddy&.email, invitee_email: invitee_email).
      deliver_later
  end
end
