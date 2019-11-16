class AddNameToMaids < ActiveRecord::Migration[6.0]
  def change
    add_column :maids, :name, :string
  end
end
