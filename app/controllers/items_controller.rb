class ItemsController < ApplicationController
  def index
    @items = Item.order('slot').page(params[:page]).per(18)
  end

  def show
    @item = Item.find(params[:id])
  end

  def category_index
    @items = Category.find(params[:id]).items.page(params[:page])
    render action: :index
  end

  def new_items_index
    @items = Item.where('created_at > ?', Date.yesterday).page(params[:page])
    render action: :index
  end

  def updated_items_index
    @items = Item.where('updated_at > ?', Date.yesterday).page(params[:page])
    render action: :index
  end

  def add_to_cart
    # add current item to session
    session[:cart] << params[:id]
    redirect_to action: :view_cart
  end

  def view_cart
    @user = User.new
    @items = []
    @price = 0
    session[:cart].each do |item|
      @price += (Item.find(item).price.to_f / 100)
      @items << Item.find(item)
    end
    session[:price] = @price
    @items = Kaminari.paginate_array(@items).page(params[:page])
    # show all items in session
  end

  def search_results # displays search
    keywords = params[:user_keywords]
    category = params[:my_options]
    if category == 'All'
      @items = Item.where('name LIKE ?', "%#{keywords}%").page(params[:page])
    else
      @items = Item.where('name LIKE ? AND slot LIKE ?',
                          "%#{keywords}%", "%#{category}%").page(params[:page])
    end
    render action: :index
  end

  def create_order
    @user = User.new(user_params)
    if (!@user.save)
      redirect_to :view_cart, notice: 'You must insert additional details.'
    else
      @order = Order.new(user_id: @user.id, price: session[:price])
      @order.save
      session[:cart].each do |item|
        @line_item = LineItem.new(order_id: @order.id, item_id: item)
       @line_item.save
     end

    session.destroy
    redirect_to :index, notice: 'Order Received.'
    end
    
  end
  
  def page
    @page = Page.where('name LIKE ?', params[:name]).first
    render 'shared/page'
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :address,
                                 :city,
                                 :country,
                                 :postal_code)
  end
end
