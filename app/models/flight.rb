class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  def formatted_duration
    "#{duration / 1.hour}h #{duration % 1.hour}m"
  end

  def formatted_departure
    departure.strftime('%d/%m/%Y %H:%M')
  end
end
