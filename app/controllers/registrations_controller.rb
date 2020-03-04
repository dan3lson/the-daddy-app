# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.subscribe(Listeners::MailerNotifier.new)

    @registration.on(:successful_registration) do
      sign_in @daddy

      redirect_to signed_in_root_path
    end
    @registration.on(:unsuccessful_registration) do
      render template: 'registrations/new'
    end

    @daddy = @registration.register
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
