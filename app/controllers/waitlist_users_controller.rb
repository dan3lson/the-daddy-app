# frozen_string_literal: true

class WaitlistUsersController < ApplicationController
  before_action :set_waitlist_user, only: %i[ show edit update destroy ]

  def index
    @waitlist_users = WaitlistUser.all
  end

  def show
  end

  def new
    @waitlist_user = WaitlistUser.new
  end

  def edit
  end

  def create
    @waitlist_user = CreateWaitlistUser.call(
      email:         waitlist_user_params[:email],
      daddy_type:    waitlist_user_params[:daddy_type],
      referral_code: waitlist_user_params[:referral_code].presence
    )
  end

  def update
    respond_to do |format|
      if @waitlist_user.update(waitlist_user_params)
        format.html { redirect_to waitlist_user_url(@waitlist_user), notice: "Waitlist user was successfully updated." }
        format.json { render :show, status: :ok, location: @waitlist_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @waitlist_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @waitlist_user.destroy

    respond_to do |format|
      format.html { redirect_to waitlist_users_url, notice: "Waitlist user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_waitlist_user
    @waitlist_user = WaitlistUser.find(params[:id])
  end

  def waitlist_user_params
    params.require(:waitlist_user).permit(:daddy_type, :email, :referral_code)
  end
end