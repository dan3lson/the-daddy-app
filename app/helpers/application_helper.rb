module ApplicationHelper
	# == Img
	#
	# Create an image with the
	# same alt and title text.
	#
	# @return <img src="" alt="" title="" />
	#
	# @params filename
	# @params description
	#
	def img(filename, description)
		image_tag(filename, alt: description, title: description)
	end
end
