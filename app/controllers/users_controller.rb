# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def create
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :city)
  end
end
