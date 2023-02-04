# frozen_string_literal: true

# Facilitates conversations between dads whether it's a root post or replies.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic, optional: true
  belongs_to :parent, class_name: :Comment, optional: true
  has_one_attached :image
  has_many :flags, dependent: :destroy
  has_many :replies,
    class_name: :Comment,
    foreign_key: :parent_id,
    dependent: :destroy
  has_many :reactions, as: :reactionable, dependent: :destroy
  has_many :likes, -> { likes }, class_name: :Reaction, as: :reactionable, dependent: :destroy

  validates :body, presence: true, length: {minimum: 3}
  validates :status, presence: true
  validates :image,
    content_type: {
      in: [:png, :jpg, :jpeg, :gif], message: "is an invalid file"
    },
    size: {less_than: 4.megabytes}

  enum status: {active: 0, inactive: 1}

  scope :root, -> { where(parent: nil) }
  scope :latest, -> { order(created_at: :desc) }

  def liked?
    likes.any?
  end

  def replies?
    replies.any?
  end

  def root?
    parent.nil?
  end

  def reply?
    !root?
  end
end
