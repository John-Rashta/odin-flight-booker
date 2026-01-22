class AddArrivalToFlights < ActiveRecord::Migration[8.1]
  def change
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }
  end
end
