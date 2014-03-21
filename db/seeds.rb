# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.destroy_all
List.destroy_all
Favorite.destroy_all

starbucks, chipotle, mcdonalds, coffee_bean, sizzler = Location.create([
  { name: 'Starbucks' },
  { name: 'Chipotle' },
  { name: "McDonald's" },
  { name: 'Coffee Bean' },
  { name: 'Sizzler' }
  ])

study_places, guilty, sixty_four = List.create([
  {
    name: 'Study Places'
  }, 
  {name: 'Guilty Pleasures'},
  {name: 'When I\'m 64'}
  ])

guilty.locations = [starbucks, mcdonalds, chipotle]
study_places.locations = [starbucks, coffee_bean]
sixty_four.locations = [sizzler]