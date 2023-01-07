# frozen_string_literal: true

module ApplicationHelper
  def current_page?(action: nil, controller: nil)
    aktion = action?(action)
    kontroller = controller?(controller)

    return aktion && kontroller if action_and_controller?(action: action, controller: controller)
    return aktion if only_action?(action: action, controller: controller)
    return kontroller if only_controller?(action: action, controller: controller)
  end

  def img(filename, description, options = {})
    image_tag(filename, alt: description, title: description, **options)
  end

  def img_pack(filename, description, options = {})
    image_pack_tag(filename, alt: description, title: description, **options)
  end

  private

  def only_action?(action: nil, controller: nil)
    action.present? && controller.blank?
  end

  def only_controller?(action: nil, controller: nil)
    action.blank? && controller.present?
  end

  def action_and_controller?(action: nil, controller: nil)
    action.present? && controller.present?
  end

  def action?(name = nil)
    return if name.blank?

    action_name == name
  end

  def controller?(name = nil)
    return if name.blank?

    controller_name == name
  end
end
