# frozen_string_literal: true

class CreateWaitlistUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :waitlist_users, id: :uuid do |t|
      t.string :email,         null: false
      t.string :daddy_type,    null: false

      t.timestamps
    end
    add_index :waitlist_users, :email, unique: true
    add_index :waitlist_users, :daddy_type
  end
end
