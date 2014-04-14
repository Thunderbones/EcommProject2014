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
    # add current item to session
    session[:cart] << Item.find(params[:id])
    redirect_to action: :viewCart
  end
  def viewCart
    
    # show all items in session
  end
  def search # Performs a search
    
  end
  def search_results # displays search
    keywords = params[:user_keywords]
    @items = Item.where("name LIKE ?", "%#{keywords}%").page(params[:page])
    render action: :index
  end
end
