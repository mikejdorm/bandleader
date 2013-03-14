class Vote < ActiveRecord::Base
  attr_accessible :song_id, :station_id, :user_id, :vote_time
    
    belongs_to :song, :counter_cache => true
  belongs_to :user
  belongs_to :hub_instance
  
  
end
