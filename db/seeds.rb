# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#  attr_accessible :date_created, :date_ended, :event_location, 
#:event_name, :user_id

if Rails.env.development?
	Station.destroy_all
	User.destroy_all
end

  u1 =  User.new username: 'mikejdorm',
 			 email: 'mikejdorm@gmail.com',
  			password: 'password',
  			password_confirmation: 'password'
  
    u2 = User.new username: 'mdorman',
 			 email: 'mdorman@uchicago.edu',
  			password: 'password',
  			password_confirmation: 'password'
  			no_avatar = File.join(Rails.root, "app/assets/images/no_avatar.jpg")
  u1.avatar = File.open(no_avatar)	
  u2.avatar = File.open(no_avatar)
  u1.save
  u2.save
  
    Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'Uchicago Station', 
  			     user_id: User.last.id
  
  Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'Bandleader Global', 
  			     user_id: User.first.id
  
    Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'My New Station', 
  			     user_id: User.last.id

    Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'The best station', 
  			     user_id: User.first.id
  
      Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'Chicago station', 
  			     user_id: User.last.id
  