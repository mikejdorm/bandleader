require 'aws-sdk'
require 'id3lib'
require 'mp4info'
require "mp3info"
class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :info, :link, :title, :broadcast_time
    serialize :info, JSON
    belongs_to :station
    has_many :votes
    default_scope :order => "votes_count DESC, created_at DESC"
  
  
  
 def parse_tags(orig_filename, tempfile)	
  	ext =  File.extname(orig_filename)
  	puts "This is the extension #{ext}"
  	case ext
  		when '.mp3'
  			parse_mp3(tempfile)
  		when ".mp4", ".m4a"
  			parse_mp4(tempfile)
  		when ".flv"
  			parse_flv(tempfile)
  		when ".ogg", ".oga"
  			parse_ogg(tempfile)
  	end
  end

  def parse_mp3(tempfile)
   # tag = ID3Lib::Tag.new(tempfile.path)
    Mp3Info.open(tempfile) do |mp3|
		if mp3.tag.artist.present?
			self.artist = mp3.tag.artist
			puts "The title is: #{self.artist}" 
		end 	
		if mp3.tag.title.present?
			self.title = mp3.tag.title
			puts "The title is: #{self.title}" 
		end
		
		if mp3.tag.album.present?
			self.album = mp3.tag.album
			puts "The album is: #{self.album}" 
		end
  	end
  end
  
  def parse_mp4(tempfile)
  	tag = MP4Info.open(tempfile)
  	if tag.ART
  		
  		self.artist = tag.artist.force_encoding('utf-8') 

  		puts "The artist is: #{self.artist}" 
  	end 	
  	if tag.NAM
  		self.title = tag.title.force_encoding('utf-8') 
  		puts "The title is: #{self.title}" 
  	end
  	if tag.ALB
  		self.album = tag.album.force_encoding('utf-8') 
  		puts "The album is: #{self.album}" 
  	end
  end
  
  def parse_flv
   
  end
  
  def parse_ogg
  
  end
  
def create_s3object(media_file)
    s3 = AWS::S3.new
    bucket = s3.buckets['bandleader_assets']
	return obj = bucket.objects.create(sanitize_filename(media_file.original_filename),
			media_file.read, :acl => :public_read)

end


  def create_url(s3object)
    doomsday = Time.mktime(2038, 1, 18).to_i
    #song.link = obj.url_for(:read, :expires => 60 * 60 * 3).to_s
	self.link = s3object.url_for(:read, :expires => doomsday).to_s
  end

def sanitize_filename(file_name)
		just_filename = File.basename(file_name)
		just_filename.sub(/[^\w\.\-]/,'_')
end
	



end
