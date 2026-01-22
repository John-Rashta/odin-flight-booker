class AddDepartureToFlights < ActiveRecord::Migration[8.1]
  def change
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
  end
end
