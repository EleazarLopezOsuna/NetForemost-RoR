class ChangeTypeOfNoteBody < ActiveRecord::Migration[7.0]
  def change
    change_column :notes, :body, :text
  end
end
