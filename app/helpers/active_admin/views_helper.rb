module ActiveAdmin
  module ViewsHelper
    def country_dropdown
      ActionView::Helpers::FormOptionsHelper::COUNTRIES
    end
  end
end