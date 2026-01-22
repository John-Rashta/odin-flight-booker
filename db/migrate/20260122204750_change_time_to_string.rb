class ChangeTimeToString < ActiveRecord::Migration[8.1]
  def change
    change_column :flights, :duration, :string
  end
end
