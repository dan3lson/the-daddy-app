class Comment < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :topic
  belongs_to :parent,  class_name:  :Comment, optional: true
  has_many   :replies, class_name:  :Comment,
                       foreign_key: :parent_id,
                       dependent:   :destroy

  # Validations
  validates :body,   presence: true
  validates :status, presence: true

  # Enums
  enum status: { active: 0, inactive: 1 }

  # Scopes
  scope :root, -> { where(parent: nil) }

  # == Replies?
  #
  # See if replies exist.
  #
  # @return Boolean
  #
  def replies?
    !replies.empty?
  end
end
