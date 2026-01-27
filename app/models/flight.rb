class Flight < ApplicationRecord
  validates :duration, presence: true
  validates :start_time, presence: true
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"
  has_many :bookings

  def start_time_formatted
    start_time.strftime("%m/%d/%Y")
  end

  def start_time_with_hours_formatted
    start_time.strftime("%m/%d/%Y %H:%M")
  end

  def start_time_seconds
    start_time.to_time.to_i
  end
end
