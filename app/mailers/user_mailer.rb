# frozen_string_literal: true

class UserMailer < ApplicationMailer
  layout "mailer"
  default template_path: "mailers/#{name.underscore}"

  def welcome(email)
    @daddy = User.find_by(email: email)

    mail(to: @email, subject: "Congrats!, and Welcome to the Daddy App")
  end

  def invite(invitee_email:, inviter_email: nil)
    @inviter_email = inviter_email
    @invitee_email = invitee_email

    mail(to: @invitee_email, subject: "You've Been Invited to The Daddy App!")
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
