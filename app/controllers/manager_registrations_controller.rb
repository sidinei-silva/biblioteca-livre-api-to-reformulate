class ManagerRegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_admin!, only: [:create]
end
