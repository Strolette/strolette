class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @item = Item.find(params[:id])
    @booking = Booking.new

    @markers =
      [{
        lat: @item.latitude,
        lng: @item.longitude
      }]

    authorize @item
  end

  def index
    if params[:category].present? && params[:start_date].present? && params[:end_date].present?
      @items = Item.where("category = :category AND start_date <= :start_date AND end_date >= :end_date",
  {category: params[:category], start_date: params[:start_date], end_date: params[:end_date]})
      # && (start_date: params[:start_date].to_date) && (end_date: params[:end_date].to_date)
    else
      @items = Item.all
    end
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { item: item })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
    @bob = policy_scope(Item)
    authorize @bob
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
                                 :start_date, :end_date, :latitude, :longitude, :query)
  end
end
