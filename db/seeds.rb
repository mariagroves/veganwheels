# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroying seed"

MenuOption.destroy_all
MenuItem.destroy_all
Restaurant.destroy_all

puts "finished destroying seed"

puts "creating restaurants"

addresses = ["10-14 Kelvinhaugh Street, Glasgow, G3 8NU, United Kingdom", "142 Renfield Street, Glasgow, G2 3AU, United Kingdom", "50 St Enoch Square, Glasgow, G1 4DH, United Kingdom", "69 Bridge Street, Glasgow, G5 9JB, United Kingdom", "171 Great Western Road, Glasgow, G4 9AW, United Kingdom", "494 Dumbarton Road, Glasgow, G11 6SL, United Kingdom", "380 Great Western Road, Glasgow, G4 9HT, United Kingdom", "65 Cambridge Street, Glasgow, G3 6QX, United Kingdom", "103 Ingram Street, Glasgow, G1 1DX, United Kingdom", "481 Great Western Road, Glasgow, G12 8HL, United Kingdom"]

10.times do |n|
    name = Faker::Restaurant.name 
    address = addresses.first
    addresses.shift
    open_time = 36000
    close_time = 54000
    about = Faker::Restaurant.description
    phone = Faker::PhoneNumber.phone_number_with_country_code
    restaurant = Restaurant.create(name: name, address: address, open_time: open_time, close_time: close_time, about: about, email: "restaurant#{n}@email.com")

    20.times do |n|
        name = Faker::Food.dish
        price = rand(800..2500).round(-1)
        description = Faker::Food.description
        is_active = true
        item = MenuItem.create(name: name, price: price, description: description, is_active: is_active, restaurant_id: restaurant.id)

        2.times do |n|
            name = Faker::Food.vegetables
            price = rand(300..800).round(-1)
            description = Faker::Lorem.sentence(word_count: 5)
            MenuOption.create(name: name, price: price, description: description, menu_item_id: item.id)
        end
    end
end

puts "finished creating restaurants"

puts "finished seeding"

