class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string  :email,                          null: false
      t.string  :first_name,                     null: false
      t.string  :last_name,                      null: false
      t.string  :city,                           null: false
      t.boolean :admin,                          null: false, default: false
      t.string  :encrypted_password, limit: 128, null: false
      t.string  :confirmation_token, limit: 128
      t.string  :remember_token,     limit: 128, null: false
      t.timestamps                               null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
