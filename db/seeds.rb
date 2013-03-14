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

  User.create username: 'mikejdorm',
 			 email: 'mikejdorm@gmail.com',
  			password: 'password',
  			password_confirmation: 'password'
  
  Station.create date_created: Time.zone.now , 
  			     event_location: 'Chicago', 
  			     event_name: 'Global station', 
  			     user_id: User.last.id
  