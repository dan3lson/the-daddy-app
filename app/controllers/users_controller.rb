# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to signed_in_root_path
    else
      render template: 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :city)
  end
end
