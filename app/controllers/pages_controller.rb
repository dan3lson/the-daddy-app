class PagesController < ApplicationController
	def homepage; end

	def join
		@waitlist_user = WaitlistUser.new

		render layout: "join"
	end

	def joined
		render layout: "join"
	end
end
