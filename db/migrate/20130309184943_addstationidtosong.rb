class Addstationidtosong < ActiveRecord::Migration
	  def self.up
	 	 add_column :songs, :station_id, :integer, :default => 0
	 	 add_column :songs, :user_id, :integer, :default => 0
	  end

	def self.down
	  remove_column :songs, :station_id
	  remove_column :songs, :user_id
	end
end
