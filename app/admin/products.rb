ActiveAdmin.register Product do
  permit_params :name, :description, :price, :rating, :image_url, :video_url, :section_id, :posicion

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :rating, :image_url, :video_url, :section_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :rating, :image_url, :video_url, :section_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
