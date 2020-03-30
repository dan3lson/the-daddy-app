# Preview all emails at http://localhost:3000/rails/mailers
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(User.first)
  end

  def invite
    UserMailer.invite(
      inviter_email: 'inviter@gmail.com',
      invitee_email: 'guest@gmail.com'
    )
  end

  def reply
    UserMailer.reply(Comment.first)
  end
end
