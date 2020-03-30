class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites, id: :uuid do |t|
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.references :user, type: :uuid, null: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :invites, :email, unique: true
  end
end
