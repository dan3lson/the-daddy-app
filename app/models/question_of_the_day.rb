# frozen_string_literal: true

class QuestionOfTheDay < ApplicationRecord
  validates :day, presence: true
  validates :question, presence: true

  def self.today
    find_by(day: Date.current) || Lib::Constants::CREATE_COMMENT_LABEL_EXAMPLES.sample
  end
end
