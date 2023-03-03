# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Note < ApplicationRecord
  belongs_to :user
  has_many :note_hashtags
  has_many :hashtags, through: :note_hashtags

  scope :with_string, lambda { |str, user_id|
    where_condition = 'notes.title LIKE ? OR notes.body LIKE ? OR hashtags.name LIKE ? AND notes.user_id = ?'
    joins(:hashtags)
      .where(where_condition, "%#{str}%", "%#{str}%", "%#{str}%", user_id)
      .distinct
  }

  def safe_delete
    note_hashtags.destroy_all
    destroy
  end

  def self.order_by_first_hashtag(user_id, direction)
    direction_quantity = "notes.id, #{direction == 'asc' ? 'MIN' : 'MAX'}(hashtags.id) AS first_hashtag"
    subquery = Note.joins(:hashtags)
                   .where(user_id:)
                   .select(direction_quantity)
                   .group('notes.id')
                   .to_sql


    joins("INNER JOIN (#{subquery}) sub ON sub.id = notes.id")
      .order("sub.first_hashtag #{direction.upcase}")
  end

  def self.get_by_user_ordered_by_field(user_id, field, direction = 'asc')
    where(user_id:).order("#{field} #{direction.upcase}")
  end
end
