# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks, id: :uuid do |t|
      t.text :body, null: false
      t.string :kind, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :feedbacks, :kind
  end
end
