# frozen_string_literal: true

# InvitesController
class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite =
      SendInvite.new(user: current_user, guest_email: invite_params[:email]).
        subscribe(MailerListener.new).
        call

    if @invite.persisted?
      message = 'Thanks for inviting another daddy to join the conversation!'
      flash[:success] = message

      redirect_to new_invite_path
    else
      @errors = @invite.errors.full_messages.join(';')

      render :new
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end
end
