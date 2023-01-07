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
end
