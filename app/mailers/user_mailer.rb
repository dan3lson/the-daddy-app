# frozen_string_literal: true

# General emails for the user
class UserMailer < ApplicationMailer
  layout 'mailer'
  default template_path: "mailers/#{name.underscore}"

  def welcome(email)
    @email = email

    mail(to: @email, subject: 'Congrats!, and Welcome to the Daddy App')
  end

  def invite(inviter_email: nil, invitee_email:)
    @inviter_email = inviter_email
    @invitee_email = invitee_email

    mail(to: @invitee_email, subject: "You've Been Invited to The Daddy App!")
  end

  def reply(comment_id)
    comment = Comment.find(comment_id)
    @daddy = comment.parent.user

    mail(
      to: @daddy.email,
      subject: 'Someone replied to your comment on The Daddy App'
    )
  end
end