class ChangeTopicsNullComments < ActiveRecord::Migration[6.0]
  def change
    change_column_null :comments, :topic_id, true
  end
end
