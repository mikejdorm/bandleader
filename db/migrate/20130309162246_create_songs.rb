class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.string :link
      t.string :info
	  
      t.timestamps
    end
  end
end
