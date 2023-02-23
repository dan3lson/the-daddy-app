# frozen_string_literal: true

# MailerListener patiently waits to send email notifications.
class MailerListener
  def successful_registration(user_id)
    UserMailer.welcome(user_id).deliver_later
    AdminMailer
      .alert(
        current_user_id: user_id,
        message: "A new user has signed up!",
        type: :info
      )
      .deliver_later
  end

  def successful_reply(comment_id)
    UserMailer.reply(comment_id).deliver_later
  end

  def successful_invite(daddy, invitee_email)
    UserMailer.
      # The safe navigator is for referrals which come from guests and not registered users.
      invite(inviter_email: daddy&.email, invitee_email: invitee_email)
      .deliver_later
  end

  def successful_waitlist_user_joined(waitlist_user)
    UserMailer.waitlist_user_joined(
      email: waitlist_user.email,
      first_name: waitlist_user.first_name,
      referral_code: waitlist_user.referral_code
    ).deliver_later
  end

  def alert(alert)
    AdminMailer.alert(alert.to_h).deliver_later
  end
end
