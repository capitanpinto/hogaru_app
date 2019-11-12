class AddMaidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :maid, :boolean
  end
end
