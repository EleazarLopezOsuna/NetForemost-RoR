class ChangeDigestTypeUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :password_digest, :text
  end
end
