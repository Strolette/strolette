class BookingsController < ApplicationController
  def create
    book = Booking.new
    book.item = params[:item_id]

    raise
  end
end
