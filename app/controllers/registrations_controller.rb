# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
    @waitlist_user_signup = OpenStruct.new(
      email: params[:email],
      first_name: params[:first_name]
    )
  end

  def create
    @registration = Registration.new(registration_params)

    @registration.subscribe(MailerListener.new)
    @registration.subscribe(InviteListener.new)

    @daddy = @registration.register

    if @daddy
      sign_in @daddy

      redirect_to onboarding_path
    else
      render template: "registrations/new"
    end
  end

  private

  def registration_params
    params.require(:registration).permit(
      :email,
      :password,
      :first_name,
      children: [%i[first_name gender birthdate]]
    )
  end
end
