class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :event_name
      t.string :event_location
      t.datetime :date_created
      t.datetime :date_ended
      t.integer :user_id

      t.timestamps
    end
  end
end
