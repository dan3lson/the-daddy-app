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

  # Enum
  enum status: { active: 0, inactive: 1 }
end
