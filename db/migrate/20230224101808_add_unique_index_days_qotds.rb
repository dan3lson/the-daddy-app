# frozen_string_literal: true

class AddUniqueIndexDaysQotds < ActiveRecord::Migration[6.0]
  def change
    remove_index :question_of_the_days, :day
    add_index :question_of_the_days, :day, unique: true
  end
end
