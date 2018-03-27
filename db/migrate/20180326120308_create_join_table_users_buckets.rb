class CreateJoinTableUsersBuckets < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :buckets do |t|
      t.index [:user_id, :bucket_id]
      t.index [:bucket_id, :user_id]
    end
  end
end
