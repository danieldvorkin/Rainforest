# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
print "Progress: "
100.times do
	Product.create(
		name: Faker::App.name,
		description: Faker::App.version,
		price_in_cents: rand(99..9999),
		avatar: Faker::Avatar.image
	)
	print "*"
end
print "\n"
print "Seed Complete: 100"
