# frozen_string_literal: true

class CreateQuestionOfTheDays < ActiveRecord::Migration[6.0]
  def change
    create_table :question_of_the_days, id: :uuid do |t|
      t.string :question, null: false
      t.date :day, null: false

      t.timestamps
    end
    add_index :question_of_the_days, :question
    add_index :question_of_the_days, :day
  end
end
