class Connection < ActiveRecord::Base
  attr_accessible :connection_time, :station_id, :user_id
    belongs_to :hub_instance
end
