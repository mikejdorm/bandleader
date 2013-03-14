class Station < ActiveRecord::Base
  attr_accessible :date_created, :date_ended, :event_location, :event_name, :user_id, :now_playing
  
  	belongs_to :user
  	has_many :songs
	has_many :connections
	has_many :posts
	
=begin
	def self.search(search)
		if(search)
  			search_condition = "%" + search + "%"
  				find(:all, :conditions => ['event_name LIKE ? OR user LIKE ?', search_condition, search_condition])
		else
			   find(:all)
		end
		
	end
=end
 
end
