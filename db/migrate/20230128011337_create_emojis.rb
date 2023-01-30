# frozen_string_literal: true

class CreateEmojis < ActiveRecord::Migration[6.0]
  def change
    create_table :emojis, id: :uuid do |t|
      t.text :emoji, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :emojis, :emoji, unique: true
    add_index :emojis, :name, unique: true
  end
end
