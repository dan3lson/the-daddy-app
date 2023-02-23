# frozen_string_literal: true

class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags, id: :uuid do |t|
      t.references :comment, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :flags, %i[comment_id user_id], unique: true
  end
end
