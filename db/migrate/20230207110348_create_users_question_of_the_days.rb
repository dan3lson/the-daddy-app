# frozen_string_literal: true

class CreateUsersQuestionOfTheDays < ActiveRecord::Migration[6.0]
  def change
    create_table :users_question_of_the_days, id: :uuid do |t|
      t.references :question_of_the_day, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :users_question_of_the_days,
      %i[question_of_the_day_id user_id],
      name: "index_user_and_question_on_users_questions_of_the_day"
  end
end
