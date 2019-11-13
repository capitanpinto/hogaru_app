class AddRetireDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :retire_date, :date
  end
end
