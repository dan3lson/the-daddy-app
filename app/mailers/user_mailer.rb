# frozen_string_literal: true

class UserMailer < ApplicationMailer
  layout "mailer"
  default template_path: "mailers/#{name.underscore}"

  def welcome(user_id)
    @daddy = User.find(user_id)

    mail(to: @email, subject: "Congrats, and welcome to the Daddy App!")
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

  # One-offs
  def alpha_release_now_live(email:, first_name:)
    @email = email
    @first_name = first_name

    mail(
      to: @email,
      subject: "Now Live -- Join the Conversations!"
    )
  end
end
