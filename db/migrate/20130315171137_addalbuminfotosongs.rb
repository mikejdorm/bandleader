class Addalbuminfotosongs < ActiveRecord::Migration
	  def self.up
	 	 add_column :songs, :small_img_url, :string, :default => 'no_art.png'
	 	 add_column :songs, :large_img_url, :string, :default => 'no_art.png'
	 	 add_column :songs, :album_release, :datetime
	  end

	def self.down
	 	 remove_column :songs, :small_img_url, :string, :default => 'no_art.png'
	 	 remove_column :songs, :large_img_url, :string, :default => 'no_art.png'
	 	 remove_column :songs, :album_release, :datetime
	end
end

