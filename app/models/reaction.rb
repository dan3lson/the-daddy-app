# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :emoji
  belongs_to :reactionable, polymorphic: true
  belongs_to :user

  validates :user,
    presence: true,
    uniqueness: {
      scope: %i[reactionable_id reactionable_type],
      message: "Only one reaction is allowed at this time"
    }

  scope :likes, -> { joins(:emoji).where(emojis: {emoji: "👍"}) }
end
