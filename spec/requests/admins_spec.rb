require 'rails_helper'
require 'factories/admin'

RSpec.describe 'Admin Auth ', type: :request do

  describe 'Post /admins_auth/sign (Login Manager)' do
    context 'context: When success' do
      it 'gives you a status 200 on signing in ' do
        auth_as(:admin)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'Post /admins_auth/ (Create Admin)' do
    let(:admin) { create(:admin) }
    let(:admin_attributes) { attributes_for(:admin) }

    before(:each) do |context|
      auth_params = auth_as(context.metadata[:auth])
      post '/api/v1/admin_auth', params: admin_attributes, headers: auth_params
    end

    context 'context: When Success' do
      it 'gives you a 200 on created admin', auth: :admin do
        expect(response.status).to eq(200)
      end
    end

    context 'context: When not authenticate' do
      it "doesn't give you anything if you don't log in" do
        expect(response.status).to eq(401)
      end
    end
  end
end
