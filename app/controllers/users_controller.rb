# frozen_string_literal: true

# UsersController
class UsersController < Clearance::UsersController
  def update
    if current_user.update(user_params)
      redirect_to signed_in_root_path
    else
      render template: 'users/update' # TODO: change redirection template
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :city)
  end
end
