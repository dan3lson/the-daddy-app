# frozen_string_literal: true

class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions, id: :uuid do |t|
      t.references :emoji, null: false, foreign_key: true, type: :uuid
      t.references :reactionable, polymorphic: true, null: false, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :reactions,
      %i[user_id reactionable_id reactionable_type],
      unique: true,
      name: "index_reactions_on_user_and_reactionable"
  end
end
