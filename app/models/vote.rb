class Vote < ActiveRecord::Base
  attr_accessible :song_id, :station_id, :user_id, :vote_time
  belongs_to :song, :counter_cache => true
  belongs_to :user
  belongs_to :hub_instance
 # before_save :already_voted
  validates_uniqueness_of :user_id, :scope => :song_id
  private	
    def already_voted
       vote = Vote.find(:first, :condtions => ["user_id = ? AND song_id = ?", self.user_id, self.song_id])
      if(vote.nil?)
      	self.save
       end
    end
  
end
