# frozen_string_literal: true

class UserMailer < ApplicationMailer
  layout "mailer"
  default template_path: "mailers/#{name.underscore}"

  def welcome(user_id)
    @daddy = User.find(user_id)

    mail(to: @daddy.email, subject: "Congrats, and Welcome")
  end

  def invite(invitee_email:, inviter_email: nil)
    @inviter_email = inviter_email
    @invitee_email = invitee_email

    mail(to: @invitee_email, subject: "You've Been Invited")
  end

  def question_of_the_day_nudge(email:, first_name:)
    @question = QuestionOfTheDay.today
    @email = email
    @first_name = first_name

    mail(to: @email, subject: "Today's Question of the Day")
  end

  def reply(comment_id)
    comment = Comment.find(comment_id)
    @daddy = comment.parent.user

    mail(
      to: @daddy.email,
      subject: "You Have a Reply"
    )
  end

  # == One-off Emails
  #
end
