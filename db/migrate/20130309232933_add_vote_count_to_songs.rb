class AddVoteCountToSongs < ActiveRecord::Migration
	  def self.up
	 	 add_column :songs, :votes_count, :integer, :default => 0
	  end

	def self.down
	  remove_column :songs, :votes_count
	end

end