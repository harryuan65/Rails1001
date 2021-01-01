class CreateAndroidReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :android_receipts do |t|
      t.string :product_type

      t.timestamps
    end
  end
end
