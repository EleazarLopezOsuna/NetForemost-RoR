# frozen_string_literal: true

require 'test_helper'

module Authentication
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'should login an user' do
      post sessions_url, params: { email: 'first_user@test.com', password: 'newPassword' }

      assert_redirected_to root_path
    end
  end
end
