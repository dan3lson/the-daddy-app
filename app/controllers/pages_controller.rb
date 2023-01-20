# frozen_string_literal: true

class PagesController < ApplicationController
  def about
  end

  def community_guidelines
    render layout: "layouts/application_signed_in"
  end

  def contact_us
  end

  def homepage
    render layout: "layouts/application_homepage"
  end

  # TODO: Move into its own resource,
  # i.e. JoinsController#create -> resources :joins, only: %i[create]
  def join
    @referral_code = params[:referral_code]
    @waitlist_user = WaitlistUser.new

    render layout: "join"
  end

  def onboarding
    render layout: "layouts/application_signed_in"
  end
end
