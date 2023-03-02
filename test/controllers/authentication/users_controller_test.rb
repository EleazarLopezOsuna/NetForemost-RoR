# frozen_string_literal: true

require 'test_helper'

module Authentication
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get new_user_url
      assert_response :success
    end

    test 'should create user' do
      assert_difference('User.count') do
        post users_url, params: { user: { email: 'new_user@test.com', name: 'New User', password: '1234567' } }
      end

      assert_redirected_to root_path
    end
  end
end
