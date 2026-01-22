class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.datetime :start_time
      t.time :duration

      t.timestamps
    end
  end
end
