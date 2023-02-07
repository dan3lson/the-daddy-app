# frozen_string_literal: true

class QuestionOfTheDay < ApplicationRecord
  has_many :users_question_of_the_days, dependent: :destroy
  has_many :users, through: :users_question_of_the_days

  validates :day, presence: true
  validates :question, presence: true

  def self.today
    find_by(day: Date.current) || Lib::Constants::CREATE_COMMENT_LABEL_EXAMPLES.sample
  end
end
