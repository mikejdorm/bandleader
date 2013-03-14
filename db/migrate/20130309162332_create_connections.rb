class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :station_id
      t.integer :user_id
      t.datetime :connection_time

      t.timestamps
    end
  end
end
