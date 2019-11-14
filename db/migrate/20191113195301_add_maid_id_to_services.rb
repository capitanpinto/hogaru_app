class AddMaidIdToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :maid_id, :integer
  end
end
