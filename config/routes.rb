Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers:{
          registrations: 'api/v1/admin_registrations'
      }
    end
  end
end
