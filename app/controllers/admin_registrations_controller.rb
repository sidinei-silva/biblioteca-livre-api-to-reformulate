class AdminRegistrationsController < ApplicationController
  before_action :authenticate_admin!, only: [:create]
end
