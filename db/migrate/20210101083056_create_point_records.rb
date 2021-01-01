class CreatePointRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :point_records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
