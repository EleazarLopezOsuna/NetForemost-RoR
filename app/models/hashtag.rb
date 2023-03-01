# frozen_string_literal: true

# == Schema Information
#
# Table name: hashtags
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hashtag < ApplicationRecord
  has_many :note_hashtags
  has_many :notes, through: :note_hashtags
end
