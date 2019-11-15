class AddAddressToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :address, :string
  end
end
