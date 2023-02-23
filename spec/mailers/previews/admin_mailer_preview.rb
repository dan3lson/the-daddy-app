# Preview all emails at http://localhost:3000/rails/mailers
class AdminMailerPreview < ActionMailer::Preview
  def alert
    AdminMailer.alert(additional_data: {}, current_user_id: nil, message: "yikes, something went wrong", type: "error")
  end
end
