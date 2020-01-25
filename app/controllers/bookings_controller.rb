class BookingsController < ApplicationController
  def create
    @book = Booking.new
    @book.item = Item.find(params[:item_id])
    @book.user = current_user
    @book.start_date = params[:booking][:start_date].split(' ')[0]
    @book.end_date = params[:booking][:start_date].split(' ')[2]
    if @book.save
      redirect_to item_bookings_path
    end
  end

  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
    @books = Booking.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    # @items = Item.find(@book.item_id)
  end

end
