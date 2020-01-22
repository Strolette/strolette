class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
    authorize @item
  end

  def index
    @items = Item.all
    @items = policy_scope(Item)

    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end

    authorize @items
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = current_user.items.build(item_params)
    @item.tag = params[:item][:tag].select { |i| !i.empty? }.join(',')
    @item.price_in_cents *= 100
    if @item.save
      redirect_to item_path(@item)
    else
      render new
    end
    authorize @item
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :description, :tag, :photo,
                                 :price_in_cents, :address, :availability,
                                 :start_date, :end_date, :latitude, :longitude)
  end
end
