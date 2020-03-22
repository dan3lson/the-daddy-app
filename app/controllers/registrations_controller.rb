# frozen_string_literal: true

# RegistrationsController
class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

    @registration.subscribe(MailerListener.new)
    @registration.subscribe(InviteListener.new)

    if @daddy = @registration.register
      sign_in @daddy

      redirect_to signed_in_root_path
    else
      render template: 'registrations/new'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(
      :email,
      :password,
      :first_name,
      :city,
      babies: [%i[first_name gender birthdate]]
    )
  end
end
