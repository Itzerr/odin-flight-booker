class FlightSearch < ApplicationRecord
  alias_attribute :from_airport, :from
  alias_attribute :to_airport, :to
  alias_attribute :departure, :departs
end
