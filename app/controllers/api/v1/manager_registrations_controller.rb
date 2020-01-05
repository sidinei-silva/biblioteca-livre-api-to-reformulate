class Api::V1::ManagerRegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :authenticate_api_v1_admin!, only: [:create]
end
