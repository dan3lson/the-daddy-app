module ApplicationHelper
  def img(filename, description, options = {})
    image_tag(filename, alt: description, title: description, **options)
  end

  def img_pack(filename, description, options = {})
    image_pack_tag(filename, alt: description, title: description, **options)
  end
end
