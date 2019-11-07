class AddTopicIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :topic, null: false, foreign_key: true, type: :uuid
  end
end
