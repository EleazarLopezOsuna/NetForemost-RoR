# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  config          :json
#  email           :string(255)
#  name            :string(255)
#  password_digest :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
