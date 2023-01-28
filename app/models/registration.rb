# frozen_string_literal: true

# This custom model signs up a daddy and their children.
class Registration
  include ActiveModel::Model
  include Wisper::Publisher

  attr_accessor :first_name, :email, :password, :city, :babies

  validates :first_name, presence: true
  validates :email, presence: true
  validate :unique_email?
  validates :password, presence: true
  validates :city, presence: true
  validates :babies, presence: true
  validate :complete_babies_info?

  def register
    return false unless valid?

    daddy = build_daddy

    if daddy.save
      create_babies!(daddy)

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

  def complete_babies_info?
    return if babies.nil?

    babies.each do |baby|
      baby_attrs = baby.last
      next unless baby_attrs.values.any?(&:blank?)

      errors.add(:babies, "info is incomplete")
    end
  end

  def build_daddy
    User.new(
      first_name: first_name.strip,
      email: email.strip,
      password: password,
      city: city.strip
    )
  end

  def create_babies!(daddy)
    babies.each do |baby|
      daddy.babies.create!(
        first_name: baby.last["first_name"].strip,
        gender: baby.last["gender"],
        birthdate: baby.last["birthdate"]
      )
    end
  end
end
