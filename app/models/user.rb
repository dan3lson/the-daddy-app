# frozen_string_literal: true

# Represents a dad
class User < ApplicationRecord
  include Clearance::User

  has_many :children, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :flags, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :likes, -> { likes }, class_name: :Reaction, dependent: :destroy
  has_many :upvotes, -> { plusses }, class_name: :Reaction, dependent: :destroy
  has_many :users_question_of_the_days, dependent: :destroy
  has_many :question_of_the_days, through: :users_question_of_the_days

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :first_name, presence: true

  # TODO: this is duplicated in a UserHelper -- delete one of them
  def children_names
    names = children.pluck(:first_name)
    num_children = names.count

    case num_children
    when 0 then ""
    when 1 then names.first
    when 2 then names.join(" and ")
    else
      names.to_sentence
    end
  end

  def flagged_comment?(comment)
    flags.pluck(:comment_id).include?(comment&.id)
  end

  def liked_comment?(comment)
    likes.pluck(:reactionable_id).include?(comment&.id)
  end

  def upvoted_feedback?(feedback)
    upvotes.pluck(:reactionable_id).include?(feedback&.id)
  end
end
