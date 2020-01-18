class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def index
    @items = Item.all
    @items = policy_scope(Item)
  end

  def new
    @item = Item.new
    authorize @item
  end
end
