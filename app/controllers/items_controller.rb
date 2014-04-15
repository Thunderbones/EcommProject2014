class ItemsController < ApplicationController
  def index
    @items = Item.order("slot").page(params[:page]).per(18)
  end
  def show
    @item = Item.find(params[:id])
  end
  def category_index
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
  def add_to_cart
    # add current item to session
    session[:cart] << params[:id]
    redirect_to action: :view_cart
  end
  def view_cart
    @order = Order.new
    @items = Array.new
    session[:cart].each {|item|
      @items << Item.find(item)
    }
    @items = Kaminari.paginate_array(@items).page(params[:page])
    # show all items in session
  end
  def search_results # displays search
    keywords = params[:user_keywords]
    category = params[:my_options]
    if category == 'All'
      @items = Item.where("name LIKE ?", "%#{keywords}%").page(params[:page])
    else
      @items = Item.where("name LIKE ? AND slot LIKE ?", "%#{keywords}%", "%#{category}%").page(params[:page])
    end
    render action: :index
  end
end
