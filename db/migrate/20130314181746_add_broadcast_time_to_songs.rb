class AddBroadcastTimeToSongs < ActiveRecord::Migration
	  def self.up
	 	 add_column :songs, :broadcast_time, :datetime, :default => nil
	  end

	def self.down
	  remove_column :songs, :broadcast_time
	end
end
