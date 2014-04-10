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
  def newItemsIndex
    @items = Item.where("created_at > ?", Date.yesterday())
    render action: :index
  end
end
