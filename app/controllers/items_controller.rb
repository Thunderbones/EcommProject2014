class ItemsController < ApplicationController
  def index
    @items = Item.order("slot")
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
  def updatedItemsIndex
    @items = Item.where("updated_at > ?", Date.yesterday())
    render action: :index
  end
  def addToCart
    #add current item to session
    redirect_to action: :viewCart
  end
  def viewCart
    #show all items in session
  end
end
