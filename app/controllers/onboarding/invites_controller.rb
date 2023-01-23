# frozen_string_literal: true

module Onboarding
  class InvitesController < ApplicationController
    def create
      invited_emails.map do |email|
        SendInvite
          .new(email: email, user: current_user)
          .subscribe(MailerListener.new)
          .call
      end
    end

    private

    def invited_emails
      params[:invite][:emails].values.reject(&:empty?)
    end

    def invite_params
      params.require(:invite).permit([emails: []])
    end
  end
end
