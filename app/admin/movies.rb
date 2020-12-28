ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :number_of_downloads, :release_date, :is_featured, :synopsis, :user_id, :languages
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :number_of_downloads, :release_date, :is_featured, :synopsis, :user_id, :languages]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
