class Flight < ApplicationRecord
  validates :duration, presence: true
  validates :start_time, presence: true
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"
end
