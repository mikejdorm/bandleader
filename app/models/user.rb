class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :username, :avatar, :password, :password_confirmation
  
  before_save { |user| user.username = username.downcase }
  validates :username, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: { with:VALID_EMAIL_REGEX }
  
  has_secure_password
  validates_uniqueness_of :username
  has_many :votes
  has_many :posts
  has_many :connections
  has_attached_file :avatar,
       :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }
       
end
