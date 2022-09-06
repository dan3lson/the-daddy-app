class PagesController < ApplicationController
	def homepage; end

	def join
		render layout: "join"
	end
end
