# frozen_string_literal: true

# Model to facilitate conversations.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic, optional: true
  belongs_to :parent, class_name: :Comment, optional: true
  has_many :replies,
           class_name: :Comment,
           foreign_key: :parent_id,
           dependent: :destroy
  has_one_attached :image

  validates :body, presence: true, length: { minimum: 3 }
  validates :status, presence: true
  validates :image,
            content_type: {
              in: [:png, :jpg, :jpeg, :gif], message: 'is an invalid file'
            },
            size: { less_than: 4.megabytes }

  enum status: { active: 0, inactive: 1 }

  scope :root,   -> { where(parent: nil) }
  scope :latest, -> { order(created_at: :desc) }

  def replies?
    !replies.empty?
  end

  def root?
    parent.nil?
  end

  def reply?
    !parent.nil?
  end
end
