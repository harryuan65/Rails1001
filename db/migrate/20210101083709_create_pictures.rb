class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :asset, null: false
      t.timestamps
    end
  end
end
