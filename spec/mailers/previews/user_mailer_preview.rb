# Preview all emails at http://localhost:3000/rails/mailers
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(User.first.id)
  end

  def invite
    UserMailer.invite(
      inviter_email: "inviter@gmail.com",
      invitee_email: "guest@gmail.com"
    )
  end

  def question_of_the_day_nudge
    UserMailer.question_of_the_day_nudge(
      email: "some@email.com",
      first_name: "Alguien"
    )
  end

  def reply
    UserMailer.reply(Comment.first.id)
  end

  def waitlist_user_joined
    UserMailer.waitlist_user_joined(
      email: "some_excited_daddy@email.com",
      first_name: "Danelson Sr.",
      referral_code: "s0meCod3"
    )
  end

  # == One-off Emails
  #

  def update_waitlist_users_before_alpha_launch
    UserMailer.update_waitlist_users_before_alpha_launch(WaitlistUser.first)
  end

  def alpha_release_now_live
    UserMailer.alpha_release_now_live(
      email: "danelson.rosa.sr@gmail.com",
      first_name: "Danelson Sr."
    )
  end
end
