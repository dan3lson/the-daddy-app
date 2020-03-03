# frozen_string_literal: true

# Model to represent a father.
class User < ApplicationRecord
  include Clearance::User

  has_many :babies,   dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :city, presence: true

  def baby_names 
    names = babies.pluck(:first_name)
    num_babies = names.size

    case num_babies
    when 0 then ''
    when 1 then	names.first
    when 2 then	names.join(' and ')
    else
      names.to_sentence
    end
  end
end
