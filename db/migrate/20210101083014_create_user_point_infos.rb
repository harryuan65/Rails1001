class CreateUserPointInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_point_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
