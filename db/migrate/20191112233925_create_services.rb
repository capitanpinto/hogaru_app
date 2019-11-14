class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.boolean :paid, :default => false
      t.date :meeting_time

      t.timestamps
    end
  end
end
