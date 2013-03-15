class Removevotetimefromvotes < ActiveRecord::Migration
 	  def self.up
	 	 remove_column :votes, :vote_time
	  end

	def self.down
	 	 add_column :votes, :vote_time, :datetime, :default => nil
	end
end
