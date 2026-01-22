# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "AB", "CD", "FG", "MN", "VZ", "PB" ].each do |aircode|
  Airport.find_or_create_by!(code: aircode)
end

all_ids = Airport.pluck(:id)
6.times do |num|
  Flight.find_or_create_by!(departure_airport_id: all_ids[num], arrival_airport_id: all_ids[5 - num], duration: "03:00:00", start_time: Time.at((rand + 0.5) * Time.now.to_i))
end
