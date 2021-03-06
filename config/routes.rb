Rails.application.routes.draw do
  resources :books
  resources :authors
  mount_devise_token_auth_for 'Admin', at: 'admin_auth', controllers: {
      registrations: 'admin_registrations'
  }
  mount_devise_token_auth_for 'Manager', at: 'manager_auth', controllers: {
      registrations: 'manager_registrations'
  }
  mount_devise_token_auth_for 'User', at: 'user_auth'

end
