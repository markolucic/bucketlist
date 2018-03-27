class ChangeColumnBuckets < ActiveRecord::Migration[5.1]
  def up
    change_column :buckets, :likes, :integer, :default => 0
  end

  def down
    change_column :buckets, :likes, :integer, :default => nil
  end
end
