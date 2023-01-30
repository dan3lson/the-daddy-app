# frozen_string_literal: true

# Represents a dad
class User < ApplicationRecord
  include Clearance::User

  has_many :babies, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :first_name, presence: true
  validates :city, presence: true

  # TODO: this is duplicated in a UserHelper -- delete one of them
  def baby_names
    names = babies.pluck(:first_name)
    num_babies = names.size

    case num_babies
    when 0 then ""
    when 1 then names.first
    when 2 then names.join(" and ")
    else
      names.to_sentence
    end
  end

  def liked_comment?(comment)
    likes.pluck(:reactionable_id).include?(comment&.id)
  end

  # TODO: turn into something like has_many :likes, -> { likes }, class_name: :Reaction
  def likes
    reactions.likes
  end
end
