module ApplicationHelper
	def img(filename, description, options = {})
		image_tag(filename, alt: description, title: description, **options)
	end
end
