class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :platform, polymorphic: true, null: false

      t.timestamps
    end
  end
end
