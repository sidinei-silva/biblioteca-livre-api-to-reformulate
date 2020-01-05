module Helpers
  module Authenticate
    def auth_as(user)
      case user
      when :admin
        # Make Login
        current_user = create(:admin)
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
        body = { email: current_user.email, password: current_user.password }.to_json
        post api_v1_admin_session_path, headers: headers, params: body

        # Get token
        client = response.headers['client']
        token = response.headers['access-token']
        expiry = response.headers['expiry']
        token_type = response.headers['token-type']
        uid = response.headers['uid']

        auth_params = {
            'access-token' => token,
            'client' => client,
            'uid' => uid,
            'expiry' => expiry,
            'token_type' => token_type
        }
      when :manager
        # Make Login
        current_user = create(:manager)
        headers = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
        body = {email: current_user.email, password: current_user.password}.to_json
        post '/api/v1/manager_auth/sign_in', headers: headers, params: body

        # Get token
        client = response.headers['client']
        token = response.headers['access-token']
        expiry = response.headers['expiry']
        token_type = response.headers['token-type']
        uid = response.headers['uid']

        auth_params = {
            'access-token' => token,
            'client' => client,
            'uid' => uid,
            'expiry' => expiry,
            'token_type' => token_type
        }
      end
    end
  end
end