Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers:{
          registrations: 'api/v1/admin_registrations'
      }
      mount_devise_token_auth_for 'Manager', at: 'manager_auth'

      as :admin do
        # Define routes for Admin within this block.
      end

      as :manager do
        # Define routes for Manager within this block.
      end

    end
  end
end
