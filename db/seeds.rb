# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroying seed"

MenuItem.destroy_all
Restaurant.destroy_all

puts "finished destroying seed"

puts "creating restaurants"

10.times do |n|
    name = Faker::Restaurant.name 
    address = Faker::Address.full_address
    open_time = 36000
    close_time = 54000
    about = Faker::Restaurant.description
    phone = Faker::PhoneNumber.phone_number_with_country_code
    restaurant = Restaurant.create(name: name, address: address, open_time: open_time, close_time: close_time, about: about, email: "restaurant#{n}@email.com")

    puts "creating menu items"

    20.times do |n|
        name = Faker::Food.dish
        price = rand(800..2500).round(-1)
        description = Faker::Food.description
        is_active = true
        MenuItem.create(name: name, price: price, description: description, is_active: is_active, restaurant_id: restaurant.id)
    end

    puts "finished creating menu items"
end

puts "finished creating restaurants"




