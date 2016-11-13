# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create! :name => 'John Doe', :email => 'john@example.com',
                    :password => 'topsecret', :password_confirmation => 'topsecret'

user.add_role :admin
user.remove_role :user
[:guest, :user, :operator, :manager, :admin].each do |role|
  Role.find_or_create_by({name: role})
end

Mpaa.find_or_create_by({name: '', comment: 'Not Rated'})
Mpaa.find_or_create_by({name: 'G', comment: 'Everyone'})
Mpaa.find_or_create_by({name: 'PG', comment: 'Parental advisory'})
Mpaa.find_or_create_by({name: 'PG-13', comment: 'Parental strongly recommended'})
Mpaa.find_or_create_by({name: 'R', comment: 'Restricted'})
Mpaa.find_or_create_by({name: 'NC', comment: 'No one under 17 allowed'})
