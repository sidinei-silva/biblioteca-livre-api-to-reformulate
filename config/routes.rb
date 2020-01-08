Rails.application.routes.draw do
  mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
      registrations: 'admin_registrations'
  }
end
