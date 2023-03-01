# == Schema Information
#
# Table name: note_hashtags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hashtag_id :bigint           not null
#  note_id    :bigint           not null
#
# Indexes
#
#  index_note_hashtags_on_hashtag_id  (hashtag_id)
#  index_note_hashtags_on_note_id     (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (hashtag_id => hashtags.id)
#  fk_rails_...  (note_id => notes.id)
#
require "test_helper"

class NoteHashtagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
