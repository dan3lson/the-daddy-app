# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :user
  has_many :reactions, as: :reactionable, dependent: :destroy
  has_many :upvotes, -> { plusses }, class_name: :Reaction, as: :reactionable, dependent: :destroy

  validates :body, presence: true, length: {minimum: 3}
  validates :kind, presence: true

  enum kind: {bug: "bug", feature_request: "feature_request"}

  scope :latest, -> { order(created_at: :desc) }

  def upvotes_count
    upvotes.count
  end
end
