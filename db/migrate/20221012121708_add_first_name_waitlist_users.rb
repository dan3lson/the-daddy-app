# frozen_string_literal: true

class AddFirstNameWaitlistUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :waitlist_users, :first_name, :string, null: false
  end
end
