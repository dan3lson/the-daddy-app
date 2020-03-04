# frozen_string_literal: true

# Sign up a Daddy and their children.
class Registration
  include ActiveModel::Model
  include Wisper::Publisher

  attr_accessor :first_name, :email, :password, :city, :babies

  validates :first_name, presence: true
  validates :email, presence: true
  validate  :unique_email?
  validates :password, presence: true
  validates :city, presence: true
  validates :babies, presence: true
  validate  :complete_babies_info?

  def register
    return false unless valid?

    daddy = build_daddy

    if daddy.save
      create_babies!(daddy)
      broadcast(:successful_registration, daddy.id)
    else
      broadcast(:unsuccessful_registration, daddy)
    end

    daddy
  end

  private

  def unique_email?
    return unless User.exists?(email: email)

    errors.add(:email, 'has already been taken')
  end

  def complete_babies_info?
    return if babies.nil?

    babies.each do |baby|
      if baby.last.values.any?(&:blank?)
        errors.add(:babies, 'info is incomplete')
        return
      end
    end
  end

  def build_daddy
    User.new(
      first_name: first_name,
      email: email,
      password: password,
      city: city
    )
  end

  def create_babies!(daddy)
    babies.each do |baby|
      daddy.babies.create!(
        first_name: baby.last['first_name'],
        gender: baby.last['gender'],
        birthdate: baby.last['birthdate']
      )
    end
  end
end
