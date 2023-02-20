# frozen_string_literal: true

class PagesController < ApplicationController
  def about
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

  # == Signed-in Pages
  #

  def community_guidelines
    render layout: "layouts/application_signed_in"
  end

  def onboarding
    @comment = Comment.new

    render layout: "layouts/application_signed_in"
  end

  def faq
    render layout: "layouts/application_signed_in"
  end

  # TODO: move this shit to the FeedbacksController#Index, tf
  def feedback
    @feedbacks = Feedback.latest
    @emoji = Emoji.plus_emoji

    render layout: "layouts/application_signed_in"
  end

  def support
    render layout: "layouts/application_signed_in"
  end
end
