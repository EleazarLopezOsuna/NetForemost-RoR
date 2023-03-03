class AddConfigToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :config, :json
    User.find_each do |user|
      user.config = {
        field: 'id',
        direction: 'asc'
      }
      user.save!
    end
  end
end
