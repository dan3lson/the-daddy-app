# Preview all emails at http://localhost:3000/rails/mailers
class AdminMailerPreview < ActionMailer::Preview
  def alert
    AdminMailer.alert(
      additional_data: {},
      current_user_id: User.first,
      message: "A new user has signed up!",
      type: "info"
    )
  end
end
