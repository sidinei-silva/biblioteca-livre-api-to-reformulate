Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  namespace :api do
    namespace :v1 do

    end
  end
end
