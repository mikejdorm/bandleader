class Post < ActiveRecord::Base
  attr_accessible :content, :post_time, :station_id, :user_id
  default_scope :order => "post_time DESC"
  belongs_to :user
  belongs_to :station
  
end
