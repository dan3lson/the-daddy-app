class PagesController < ApplicationController
	def homepage; end

	# Move into its own resource , i.e. JoinsController#create -> resources :joins, only: %i[create]
	def join
		@referral_code = params[:referral_code]
		@waitlist_user = WaitlistUser.new

		render layout: "join"
	end
end
