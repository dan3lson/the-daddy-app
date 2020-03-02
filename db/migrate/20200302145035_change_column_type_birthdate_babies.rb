class ChangeColumnTypeBirthdateBabies < ActiveRecord::Migration[6.0]
  def change
    remove_column :babies, :birthdate, :datetime
    add_column    :babies, :birthdate, :date, null: false
  end
end
