# frozen_string_literal: true

class Emoji < ApplicationRecord
  has_many :reactions, dependent: :restrict_with_error

  validates :emoji, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.like_emoji
    find_or_create_by(emoji: "👍", name: "thumbs-up-default")
  end

  def self.plus_emoji
    find_or_create_by(emoji: "➕", name: "plus")
  end
end
