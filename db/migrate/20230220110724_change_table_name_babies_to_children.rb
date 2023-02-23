# frozen_string_literal: true

class ChangeTableNameBabiesToChildren < ActiveRecord::Migration[6.0]
  def change
    rename_table :babies, :children
  end
end
