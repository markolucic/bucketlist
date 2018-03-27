class CreateBuckets < ActiveRecord::Migration[5.1]
  def change
    create_table :buckets do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :likes

      t.timestamps
    end
  end
end
