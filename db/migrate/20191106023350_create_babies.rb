class CreateBabies < ActiveRecord::Migration[6.0]
  def change
    create_table :babies do |t|
      t.string     :name,      null: false
      t.integer    :gender,    null: false
      t.datetime   :birthdate, null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps             null: false
    end
  end
end
