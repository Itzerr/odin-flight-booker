class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  def new
    redirect_back fallback_location: root_path, alert: 'Please select passengers count and search again' if booking_params[:passengers].empty?
    @booking = Booking.new({ flight_id: booking_params[:flight_id] })
    p @booking
    booking_params[:passengers].to_i.times do
      @booking.passengers.build
    end
    @flight = @booking.flight
  end

  def create
    @booking = Booking.new(create_booking_params)
    @flight = @booking.flight
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_back fallback_location: root_path, alert: @booking.errors.full_messages.to_sentence
    end
  end

  private

  def booking_params
    params.require(:booking).permit(%i[flight_id passengers])
  end

  def create_booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
