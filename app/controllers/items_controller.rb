class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def index
    @items = Item.all
    @items = policy_scope(Item)
    authorize @items
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = current_user.items.build(item_params)
    @item.tag = params[:item][:tag].select { |i| !i.empty? }.join(',')
    if @item.save
      redirect_to items_path
    else
      render new
    end
    authorize @item
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :description, :tag,
                                 :price_in_cents, :address, :availability,
                                 :start_date, :end_date, :latitude, :longitude)
  end
end
