# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroying seed"
OrderItemOption.destroy_all
OrderItem.destroy_all
Cart.destroy_all
MenuOption.destroy_all
MenuItem.destroy_all
Section.destroy_all
Restaurant.destroy_all
AdminUser.destroy_all
User.destroy_all

puts "finished destroying seed"

puts "creating admins"

admin1 = AdminUser.create(email: "mono@email.com", password: 123456, role: "restaurant")
admin2 = AdminUser.create(email: "13thnote@email.com", password: 123456, role: "restaurant")
admin3 = AdminUser.create(email: "vandv@email.com", password: 123456, role: "restaurant")
admin4 = AdminUser.create(email: "flyingduck@email.com", password: 123456, role: "restaurant")
admin5 = AdminUser.create(email: "glasvegan@email.com", password: 123456, role: "restaurant")
admin6 = AdminUser.create(email: "stereo@email.com", password: 123456, role: "restaurant")
admin7 = AdminUser.create(email: "78@email.com", password: 123456, role: "restaurant")
admin8 = AdminUser.create(email: "serenitynow@email.com", password: 123456, role: "restaurant")
admin9 = AdminUser.create(email: "picnic@email.com", password: 123456, role: "restaurant")
admin10 = AdminUser.create(email: "soulkitchen@email.com", password: 123456, role: "restaurant")
AdminUser.create(email: "admin@email.com", password: 123456, role: "admin")

puts "finished creating admins"

puts "creating user"

User.create(email: "maria@email.com", password: 123456, phone: 17595910089, first_name: "Maria", last_name: "Groves")

puts "finished creating user"

puts "creating restaurants"


restaurant1 = Restaurant.create(
    name: "Mono",
    address: "12 Kings Court, Glasgow, G1 5RB, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "Mono opened in 2002, furnishing Glasgow with a unique and versatile space in which to eat, drink and discover new music. Over our first decade, we developed a reputation for good beer, good vegan food, good gigs and good times. We are proud of our achievements but we aim to make our second decade even better.",
    phone: '01415532400'.to_i,
    email: "mono@email.com",
    imagekey: 1,
    website: "http://www.monocafebar.com/",
    admin_user: admin1
)

restaurant2 = Restaurant.create(
    name: "13th Note",
    address: "50-60 King Street, Glasgow, G1 5QT, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "Welcome to The 13th Note Cafe, an independent bar, restaurant and venue in Glasgow’s Merchant City. We cater for a vegan diet – all of our food is ethically sourced and free from animal cruelty – and stock a fine selection of vegan beers, lagers and wines.",
    phone: '01415531638'.to_i,
    email: "13thnote@email.com",
    imagekey: 2,
    website: "http://13thnote.co.uk/",
    admin_user: admin2
)

restaurant3 = Restaurant.create(
    name: "The V&V Cafe",
    address: "481 Great Western Road, Glasgow, G12 8HL, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "The V&V Cafe on Great Western Road was opened as a vegetarian and vegan cafe, but has relaunched a fully vegan menu in January 2018! The standard menu at the V&V includes several breakfast items, like porridge, yogurt with berries, a VLT sandwich and a vegan sausage bap. For lunch you can choose from a variety of toasties, sandwiches, baked potato, pakora kebab and the signature pakora toastie. Finally, you can also have the soup or the curry of the day, different pies and mediterranean flatbread with all kinds of fillings",
    phone: '01412377902'.to_i,
    email: "vandv@email.com",
    imagekey: 3,
    website: "https://www.facebook.com/thevandvcafe/",
    admin_user: admin3
)

restaurant4 = Restaurant.create(
    name: "The Flying Duck",
    address: "142 Renfield Street, Glasgow, G2 3AU, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "We are a basement bar, venue and vegan diner tucked  away  in Glasgow’s city centre. Established in 2007, The Duck is an integral part of Glasgow’s underground music, vegan and drinking scene. A sister venue to Stereo, Mono, The Old Hairdressers & The 78, we’re a bit of the black sheep of the family. With a dive bar vibe and food that rivals the biggest Michigan sized portions, we’re throwing a big set of the V’s to the traditional image of 'veganness'.",
    phone: '01415641450'.to_i,
    email: "flyingduck@email.com",
    imagekey: 4,
    website: "https://www.theflyingduck.org/",
    admin_user: admin4
)

restaurant5 = Restaurant.create(
    name: "Glasvegan",
    address: "50 St Enoch Square, Glasgow, G1 4DH, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "100% plant based fast food in the heart of Glasgow. Sustainable and vegan, so you know you can treat yourself guilt-free!",
    phone: '01412263075'.to_i,
    email: "glasvegan@email.com",
    imagekey: 1,
    website: "https://www.facebook.com/theglasvegan/",
    admin_user: admin5
)

restaurant6 = Restaurant.create(
    name: "Stereo",
    address: "22 Renfield Lane, Glasgow, G2 5AR, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "We've been around in Glasgow's city centre since 2007 in our beautiful building designed by the one and only Charles Rennie Mackintosh. Cosily snuggled into Renfield Lane we offer you a range of sensory pleasures! A dedicated vegan bar & kitchen during the day and into the dusty evenings, you'll be amazed by our unbeatable menu, cold beers and varied selection of boozy delights.",
    phone: '01412222254'.to_i,
    email: "stereo@email.com",
    imagekey: 2,
    website: "https://www.stereocafebar.com/",
    admin_user: admin6
)

restaurant7 = Restaurant.create(
    name: "The 78",
    address: "10-14 Kelvinhaugh Street, Glasgow, G3 8NU, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "Next to its sister establishments Mono, Stereo, The Old Hairdresser’s and The Flying Duck, and it’s new East-coast cousin Harmonium, The 78 is something of an odd one out. It’s situated in Glasgow’s West End, for one thing – just off Argyle Street in the popular Finnieston neighbourhood. With chunky wooden tables, an open kitchen hatch at one end of the room and an open fire at the other, the atmosphere is cosy and relaxed, as is the service. The bar and kitchen, like the other bars in its stable, are 100% vegan, and the food is delightfully done at prices that buck the trend for the area.",
    phone: '01415765018'.to_i,
    email: "78@email.com",
    imagekey: 3,
    website: "https://www.the78barandkitchen.com/",
    admin_user: admin7
)

restaurant8 = Restaurant.create(
    name: "Serenity Now",
    address: "380 Great Western Road, Glasgow, G4 9HT, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "Founded in 2017, Serenity Now is a plant-based cafe in Glasgow's West End, focussing on fresh, healthy vegan cuisine, world-class coffee (courtesy of our good friends at Dark Arts) and smoothies that'll knock your socks off. All of our recipes are created by us and cooked from scratch right here in our kitchen, 100% free from animal produce but with plenty of love & care.",
    phone: '01412618065'.to_i,
    email: "serenitynow@email.com",
    imagekey: 4,
    website: "https://www.serenitynowcafe.com/",
    admin_user: admin8
)

restaurant9 = Restaurant.create(
    name: "Picnic",
    address: "103 Ingram Street, Glasgow, G1 1DX, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "Picnic was established in 2016 by Michelle Morrow to offer a healthy and ethical alternative to other Merchant City eateries. With a focus on fresh, whole, organic food and cruelty free ingredients, Picnic provides its customers with refreshing, delicious food in an airy, stylish and comfortable environment.",
    phone: '01415528788'.to_i,
    email: "picnic@email.com",
    imagekey: 1,
    website: "http://picnic-cafe.co.uk/",
    admin_user: admin9
)

restaurant10 = Restaurant.create(
    name: "Soul Kitchen",
    address: "973 Sauchiehall Street, Glasgow, G3 7TQ, United Kingdom",
    open_time: 36000,
    close_time: 54000,
    about: "We are a 100% plant-based restaurant with health and wellbeing at the heart and soul of everything we do. We were established to bring deliciously healthy plant-based food to Glasgow, unlike anything you have seen before.",
    phone: '01414065292'.to_i,
    email: "soulkitchen@email.com",
    imagekey: 2,
    website: "https://www.soulfoodkitchen.co.uk/",
    admin_user: admin10
)

photo1 = URI.open('https://bigseventravel.com/wp-content/uploads/2019/12/oh.jpg')
photo2 = URI.open('https://images.happycow.net/venues/1024/97/42/hcmp97421_380105.jpeg')
photo3 = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vegetarian-recipe-tomato-cucumber-farro-salad-1567097097.jpg')
photo4 = URI.open('https://www.feastingathome.com/wp-content/uploads/2019/01/collard-greens-wraps-100.jpg')
photo5 = URI.open('https://thebusybaker.ca/wp-content/uploads/2017/11/vegan-chocolate-mousse-cheesecake-fbig4-500x500.jpg')
photo6 = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/11/9c/2b/f3/raw-vegan-spring-rolls.jpg')
photo7 = URI.open('https://www.delishknowledge.com/wp-content/uploads/greengoddessveggiesandwich.jpg')
photo8 = URI.open('https://simple-veganista.com/wp-content/uploads/2012/07/raw-vegan-sushi-rolls-5.jpg')
photo9 = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/11/9c/2b/f3/raw-vegan-spring-rolls.jpg')
photo10 = URI.open('https://i.pinimg.com/originals/4f/88/96/4f8896abe38f2f9d14c724f88023fa7d.jpg')

restaurant1.photo.attach(io: photo1, filename: 'vegan1.jpg', content_type: 'image/jpg')
restaurant2.photo.attach(io: photo2, filename: 'vegan2.jpg', content_type: 'image/jpg')
restaurant3.photo.attach(io: photo3, filename: 'vegan3.jpg', content_type: 'image/jpg')
restaurant4.photo.attach(io: photo4, filename: 'vegan4.jpg', content_type: 'image/jpg')
restaurant5.photo.attach(io: photo5, filename: 'vegan5.jpg', content_type: 'image/jpg')
restaurant6.photo.attach(io: photo6, filename: 'vegan6.jpg', content_type: 'image/jpg')
restaurant7.photo.attach(io: photo7, filename: 'vegan7.jpg', content_type: 'image/jpg')
restaurant8.photo.attach(io: photo8, filename: 'vegan8.jpg', content_type: 'image/jpg')
restaurant9.photo.attach(io: photo9, filename: 'vegan9.jpg', content_type: 'image/jpg')
restaurant10.photo.attach(io: photo10, filename: 'vegan10.jpg', content_type: 'image/jpg')

puts "finished creating restaurants"

puts "creating sections and menus"

Restaurant.all.each do |restaurant|
    Section.create(name: "Starters", order: 1, restaurant_id: restaurant.id)
    Section.create(name: "Mains", order: 2, restaurant_id: restaurant.id)
    Section.create(name: "Desserts", order: 3, restaurant_id: restaurant.id)
    20.times do |n|
        name = Faker::Food.dish
        price = rand(800..2500).round(-1)
        description = Faker::Lorem.sentence(word_count: 10)
        is_active = true
        section = Section.where(restaurant_id: restaurant.id).sample
        item = MenuItem.create(name: name, price: price, description: description, is_active: is_active, restaurant_id: restaurant.id, section_id: section.id)
    
        2.times do |n|
            name = Faker::Food.vegetables
            price = rand(300..800).round(-1)
            description = Faker::Lorem.sentence(word_count: 5)
            MenuOption.create(name: name, price: price, description: description, menu_item_id: item.id)
        end
    end
end

puts "finished creating sections and menus"

puts "finished seeding"