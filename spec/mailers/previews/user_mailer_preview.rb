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
end
