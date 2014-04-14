class ItemsController < ApplicationController
  def index
    @items = Item.order("slot").page(params[:page]).per(20)
  end
  def show
    @item = Item.find(params[:id])
  end
  def categoryIndex
    @items = Category.find(params[:id]).items.page(params[:page])
    render action: :index
  end
  def newItemsIndex
    @items = Item.where("created_at > ?", Date.yesterday()).page(params[:page])
    render action: :index
  end
  def updatedItemsIndex
    @items = Item.where("updated_at > ?", Date.yesterday()).page(params[:page])
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
