# frozen_string_literal: true

# General emails for the user
class UserMailer < ApplicationMailer
  layout 'mailer'
  default template_path: "mailers/#{name.underscore}"

  def welcome(daddy)
    @daddy = daddy

    mail(to: @daddy.email, subject: 'Congrats!, and Welcome to the Daddy App')
  end

  def invite(inviter:, invitee:)
    @inviter = inviter
    @invitee = invitee

    mail(to: @invitee, subject: "You've Been Invited to The Daddy App!")
  end

  def reply(comment)
    @daddy = comment.parent.user

    mail(
      to: @daddy.email,
      subject: 'Someone replied to your comment on The Daddy App'
    )
  end
end
