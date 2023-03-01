class CreateNoteHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :note_hashtags do |t|
      t.references :note, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
