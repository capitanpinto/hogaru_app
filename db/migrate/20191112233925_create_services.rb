class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.boolean :paid
      t.date :meeting_time

      t.timestamps
    end
    add_index :services, [:user_id, :maid_id]
  end
end
