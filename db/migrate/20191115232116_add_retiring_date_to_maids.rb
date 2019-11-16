class AddRetiringDateToMaids < ActiveRecord::Migration[6.0]
  def change
    add_column :maids, :retiring_date, :date
  end
end
