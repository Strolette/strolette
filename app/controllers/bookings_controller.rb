class BookingsController < ApplicationController
  def create
    book = Booking.new
    book.item = Item.find(params[:item_id])
    book.user = current_user
    book.start_date = params[:booking][:start_date].split(' ')[0]
    book.end_date = params[:booking][:start_date].split(' ')[2]
    book.save
    authorize book
  end
end
