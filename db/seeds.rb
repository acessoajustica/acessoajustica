# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Creating roles.
admin_role = Role.create!(:name => "admin")

Role.create!(:name => "diretor")
Role.create!(:name => "calouro")
Role.create!(:name => "estagiário")

# create an admin user
admin_user = User.create!(:email=>'test@test.com',:username=>'admin',:password=>'password')

# assign the admin role to the admin user.  (This bit of rails
# magic creates a user_role record in the database.)
admin_user.roles << admin_role
