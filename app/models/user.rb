# frozen_string_literal: true

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
class User < ApplicationRecord
  has_secure_password
  has_many :notes
  validates :email, presence: true, uniqueness: true,
                    format: {
                      with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i,
                      message: :invalid
                    }
  validates :name, presence: true
  validate :password_check

  before_save :downcase_attributes

  private

  def password_check
    return if password.nil?
    return if password.size > 5 && (new_record? || password.changed?)

    errors.add :password, 'Must have at least 6 characters'
  end

  def downcase_attributes
    self.email = email.downcase
  end
end
