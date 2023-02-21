# frozen_string_literal: true

class ReferenceUsersQotdInComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :users_question_of_the_day, type: :uuid, foreign_key: true
  end
end
