class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :station_id
      t.integer :song_id
      t.integer :user_id
      t.datetime :vote_time

      t.timestamps
    end
  end
end
