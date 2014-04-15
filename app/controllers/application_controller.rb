class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_categories, :load_session
  def load_categories
    @categories = Category.all
    @categoryNames = Array.new
    @categoryNames << 'All'
    @categories.each {|c|
      @categoryNames << c.name
    }
  end
  def load_session
    session[:cart] ||= Array.new
  end

end
