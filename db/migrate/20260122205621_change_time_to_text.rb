class ChangeTimeToText < ActiveRecord::Migration[8.1]
  def change
    change_column :flights, :duration, :text
  end
end
