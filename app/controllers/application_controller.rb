class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_categories, :load_session
  def load_categories
    @categories = Category.all
    @category_names = []
    @category_names << 'All'
    @categories.each do |c|
      @category_names << c.name
    end
  end

  def load_session
    session[:cart] ||= []
    session[:price] ||= 0
  end
end
