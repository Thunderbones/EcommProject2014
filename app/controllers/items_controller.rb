class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
  end
  def categoryIndex
    @items = Category.find(params[:id]).items
    render action: :index
  end
end
