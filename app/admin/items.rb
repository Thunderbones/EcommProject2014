ActiveAdmin.register Item do
  config.per_page = 10

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs
  # /2-resource-customization.mdsetting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
