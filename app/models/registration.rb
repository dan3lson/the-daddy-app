# frozen_string_literal: true

# This custom model signs up a daddy and their children.
class Registration
  include ActiveModel::Model
  include Wisper::Publisher

  attr_accessor :first_name, :email, :password, :children

  validates :first_name, presence: true
  validates :email, presence: true
  validate :unique_email?
  validates :password, presence: true
  validates :children, presence: true
  validate :complete_children_info?

  def register
    return false unless valid?

    daddy = build_daddy

    if daddy.save
      create_children!(daddy)

      broadcast(:successful_registration, daddy.id)
      broadcast(:complete_invite, daddy.email)
    end

    daddy
  end

  private

  def unique_email?
    return unless User.exists?(email: email&.strip)

    errors.add(:email, "has already been taken")
  end

  def complete_children_info?
    return if children.nil?

    children.each do |child|
      child_attrs = child.last
      next unless child_attrs.values.any?(&:blank?)

      errors.add(:children, "info is incomplete")
    end
  end

  def build_daddy
    User.new(
      first_name: first_name.strip,
      email: email.strip,
      password: password
    )
  end

  def create_children!(daddy)
    children.each do |child|
      daddy.children.create!(
        first_name: child.last["first_name"].strip,
        gender: child.last["gender"],
        birthdate: child.last["birthdate"]
      )
    end
  end
end
