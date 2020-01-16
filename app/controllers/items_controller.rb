class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    authorize @item
  end
end
