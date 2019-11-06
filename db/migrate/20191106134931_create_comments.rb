class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :body,   null: false
      t.integer    :status, null: false, default: 0
      t.references :user,   null: false, foreign_key: true
      t.references :parent,              index: true

      t.timestamps null: false
    end
  end
end
