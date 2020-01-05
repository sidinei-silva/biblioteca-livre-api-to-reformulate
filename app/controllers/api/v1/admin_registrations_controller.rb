module Api::V1
  class AdminRegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :authenticate_api_v1_admin!, only: [:create]
  end
end

