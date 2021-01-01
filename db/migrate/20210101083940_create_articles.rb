class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :picture_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
