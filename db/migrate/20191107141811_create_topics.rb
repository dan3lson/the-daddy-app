class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps    null: false
    end
  end
end
