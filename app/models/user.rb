# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
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
  validates :password, length: { minimum: 6 }

  before_save :downcase_attributes

  private

  def downcase_attributes
    self.email = email.downcase
  end
end
