class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :station_id
      t.datetime :post_time
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
