require 'rails_helper'
require 'factories/manager'
require 'factories/admin'

RSpec.describe 'Managers Auth', type: :request do
  describe 'Post /managers_auth/sign (Login Manager)' do
    context 'context: When success' do
      it 'gives you a status 200 on signing in ' do
        auth_as(:manager)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'Post /managers_auth/ (Create Manager)' do
    let(:manager) { create(:manager) }
    let(:manager_attributes) { attributes_for(:manager) }

    before(:each) do |context|
      auth_params = auth_as(context.metadata[:auth])
      post '/api/v1/manager_auth', params: manager_attributes, headers: auth_params
    end
    
    context 'context: When Success' do
      it 'gives you a status 200 on create', auth: :admin do
        expect(response.status).to eq(200)
      end
    end

    context 'context: When not authenticate' do
      it 'gives you a status 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'context: When not admin user' do
      it 'gives you a status 401', auth: :manager do
        expect(response.status).to eq(401)
      end
    end
  end
end
