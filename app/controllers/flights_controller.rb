class FlightsController < ApplicationController
  def index
    @flight_search = FlightSearch.new(search_params)
    @flights = Flight.includes(:from_airport, :to_airport).where(flight_params).all
  end

  private

  def search_params
    params.fetch(:flight_search, {}).permit(%i[from_airport to_airport departure passengers]).delete_if { |_, v| v.empty? }
  end

  def flight_params
    params.fetch(:flight_search, {}).permit(%i[from_airport to_airport departure]).delete_if { |_, v| v.empty? }
  end
end
