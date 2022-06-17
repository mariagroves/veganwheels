# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "time"
require "faker"

puts "destroying seed"
RiderWorkArea.destroy_all
WorkArea.destroy_all
Delivery.delete_all
RiderUser.destroy_all
OrderItemOption.destroy_all
OrderItem.destroy_all
Order.destroy_all
Cart.destroy_all
MenuOption.destroy_all
MenuItem.destroy_all
Section.destroy_all
Restaurant.destroy_all
AdminUser.destroy_all
Business.destroy_all
User.destroy_all

puts "finished destroying seed"

puts "creating admins"

admin1 = AdminUser.create(email: "mono@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin2 = AdminUser.create(email: "13thnote@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin3 = AdminUser.create(email: "vandv@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin4 = AdminUser.create(email: "flyingduck@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin5 = AdminUser.create(email: "glasvegan@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin6 = AdminUser.create(email: "stereo@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin7 = AdminUser.create(email: "78@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin8 = AdminUser.create(email: "serenitynow@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin9 = AdminUser.create(email: "picnic@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
admin10 = AdminUser.create(email: "soulkitchen@email.com", password: 12345678, role: "restaurant", phone: "+447595910074")
AdminUser.create(email: "admin@email.com", password: 12345678, role: "admin", phone: "+447595910074")

puts "finished creating admins"

puts "creating riders"

rider1 = RiderUser.create(email: "andy@email.com", password: 12345678, first_name: "Andy", last_name: "Yeung", phone: "+447747128872")
rider2 = RiderUser.create(email: "maria@email.com", password: 12345678, first_name: "Maria", last_name: "Groves", phone: "+447595910074")

puts "finished creating riders"

puts "creating rider work areas"

area1 = WorkArea.create(postcode: "G2 3AU")
area2 = WorkArea.create(postcode: "G4 9HT")

RiderWorkArea.create(rider_user_id: rider1.id, work_area_id: area1.id)
RiderWorkArea.create(rider_user_id: rider2.id, work_area_id: area2.id)

rider2.update(is_available: true)

puts "finished creating rider work areas"

puts "creating user"

#User.create(first_name: "Maria", last_name: "Groves", email: "mariagrovesh@gmail.com", password: 12345678, phone: "07595910074", street_address: "1191 Royston Road", city: "Glasgow", postcode: "G33 1EY")

puts "finished creating user"

puts "creating business information"

about = "<p><strong>Sollicitudin augue lobortis sem volutpat diam amet sit malesuada. </strong>Habitasse volutpat feugiat lobortis rhoncus elit ac aliquam. Vulputate tincidunt lacus tempus tempor nibh sit. Ut pellentesque mattis senectus non. Sapien in gravida tincidunt nisi, ullamcorper.</p><p><br></p><p><strong>Amet tellus a orci, cras orci. </strong>Hac pellentesque lacus senectus sed ut. Ullamcorper iaculis nullam quis enim cursus urna ultrices adipiscing. Nam non integer nunc, eget laoreet diam condimentum. Dictum elementum ut faucibus odio eget. Eget sed imperdiet mauris, habitant.</p><p><br></p><p><strong>Turpis sit lorem cras enim et netus etiam. </strong>Nullam scelerisque congue sed adipiscing id arcu nibh adipiscing. Nam non integer nunc, eget laoreet diam condimentum. Dictum elementum ut faucibus odio eget. Eget sed imperdiet mauris, habitant. Consectetur tristique sed in tortor mauris morbi ante sed.</p>"

faqs = "<p><strong>Sollicitudin augue lobortis sem volutpat diam amet sit malesuada? </strong></p><p>Habitasse volutpat feugiat lobortis rhoncus elit ac aliquam. Vulputate tincidunt lacus tempus tempor nibh sit. Ut pellentesque mattis senectus non. Sapien in gravida tincidunt nisi, ullamcorper.</p><p><br></p><p><strong>Amet tellus a orci, cras orci? </strong></p><p>Hac pellentesque lacus senectus sed ut. Ullamcorper iaculis nullam quis enim cursus urna ultrices adipiscing. Nam non integer nunc, eget laoreet diam condimentum. Dictum elementum ut faucibus odio eget. Eget sed imperdiet mauris, habitant.</p><p><br></p><p><strong>Turpis sit lorem cras enim et netus etiam? </strong></p><p><strong></strong>Nullam scelerisque congue sed adipiscing id arcu nibh adipiscing. Nam non integer nunc, eget laoreet diam condimentum. Dictum elementum ut faucibus odio eget. Eget sed imperdiet mauris, habitant. Consectetur tristique sed in tortor mauris morbi ante sed.</p>"

privacy = "<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus placeat minus, numquam quo non a cumque optio, accusantium sunt, assumenda sed quae ullam. Rem eveniet itaque error atque adipisci! Officiis. Recusandae magnam, ut sapiente reiciendis quibusdam voluptate iusto est nulla quas explicabo optio. At voluptas quam eaque porro alias, esse vitae non molestias assumenda nisi minima velit omnis, eum deserunt.</p><p><br></p><p>Dolore labore mollitia rerum est minima quod laudantium alias, temporibus sed perferendis aut asperiores, eligendi nisi similique corporis impedit perspiciatis doloribus dolorum sit? Corrupti necessitatibus nulla alias dolore, molestias cum. Exercitationem deleniti officia, suscipit eligendi a possimus at tempora, iusto animi culpa ducimus magni sapiente, dolor vitae veritatis magnam. Dolores, doloribus nulla rerum veniam deleniti beatae voluptate explicabo asperiores nam.</p><p><br></p><p>Perspiciatis harum sint cupiditate reprehenderit nisi. Tenetur ipsam alias fugit! Quis aperiam porro facilis ipsum quos a voluptas exercitationem provident totam. Impedit, pariatur. Molestiae possimus ut quo dolor ipsum dicta. Eligendi tempora earum commodi sapiente perspiciatis consequuntur accusantium voluptas atque veritatis, excepturi mollitia nihil, quibusdam dicta est odit vel temporibus. Dolores ipsum sit nobis deleniti suscipit iusto, alias quam optio.</p><p><br></p><p>Voluptas quas aspernatur possimus repudiandae natus rerum deserunt consequatur cumque veniam quaerat eius molestiae iure ullam reprehenderit odit cum, quae earum incidunt voluptate sint. Alias deserunt hic facilis repellat quae. Natus aliquid, ad minus laboriosam corporis veritatis culpa hic repellat aliquam quibusdam delectus dolorum placeat modi. Qui temporibus dolores porro maiores, eius iure. Dignissimos odit architecto libero fuga nesciunt officiis.</p><p><br></p><p>Culpa vitae cumque aliquid sequi repellat fuga, maxime doloremque ut voluptas doloribus architecto a pariatur consequatur. Voluptates sequi cum quod odio in explicabo, vitae, adipisci quam tempore, culpa maiores iste! Natus magnam a minus ad at voluptas quisquam nobis, vero, dolor earum necessitatibus tenetur dicta sit ducimus officia. Sapiente molestiae nostrum voluptatem minima adipisci? Cupiditate dolores doloribus tempora consequuntur nesciunt.</p>"

terms = "<ol><li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus placeat minus, numquam quo non a cumque optio, accusantium sunt, assumenda sed quae ullam. Rem eveniet itaque error atque adipisci! Officiis. Recusandae magnam, ut sapiente reiciendis quibusdam voluptate iusto est nulla quas explicabo optio. At voluptas quam eaque porro alias, esse vitae non molestias assumenda nisi minima velit omnis, eum deserunt.</li><li>Dolore labore mollitia rerum est minima quod laudantium alias, temporibus sed perferendis aut asperiores, eligendi nisi similique corporis impedit perspiciatis doloribus dolorum sit? Corrupti necessitatibus nulla alias dolore, molestias cum. Exercitationem deleniti officia, suscipit eligendi a possimus at tempora, iusto animi culpa ducimus magni sapiente, dolor vitae veritatis magnam. Dolores, doloribus nulla rerum veniam deleniti beatae voluptate explicabo asperiores nam.</li><li>Perspiciatis harum sint cupiditate reprehenderit nisi. Tenetur ipsam alias fugit! Quis aperiam porro facilis ipsum quos a voluptas exercitationem provident totam. Impedit, pariatur. Molestiae possimus ut quo dolor ipsum dicta. Eligendi tempora earum commodi sapiente perspiciatis consequuntur accusantium voluptas atque veritatis, excepturi mollitia nihil, quibusdam dicta est odit vel temporibus. Dolores ipsum sit nobis deleniti suscipit iusto, alias quam optio.</li><li>Voluptas quas aspernatur possimus repudiandae natus rerum deserunt consequatur cumque veniam quaerat eius molestiae iure ullam reprehenderit odit cum, quae earum incidunt voluptate sint. Alias deserunt hic facilis repellat quae. Natus aliquid, ad minus laboriosam corporis veritatis culpa hic repellat aliquam quibusdam delectus dolorum placeat modi. Qui temporibus dolores porro maiores, eius iure. Dignissimos odit architecto libero fuga nesciunt officiis.</li><li>Culpa vitae cumque aliquid sequi repellat fuga, maxime doloremque ut voluptas doloribus architecto a pariatur consequatur. Voluptates sequi cum quod odio in explicabo, vitae, adipisci quam tempore, culpa maiores iste! Natus magnam a minus ad at voluptas quisquam nobis, vero, dolor earum necessitatibus tenetur dicta sit ducimus officia. Sapiente molestiae nostrum voluptatem minima adipisci? Cupiditate dolores doloribus tempora consequuntur nesciunt.</li><li>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus placeat minus, numquam quo non a cumque optio, accusantium sunt, assumenda sed quae ullam. Rem eveniet itaque error atque adipisci! Officiis. Recusandae magnam, ut sapiente reiciendis quibusdam voluptate iusto est nulla quas explicabo optio. At voluptas quam eaque porro alias, esse vitae non molestias assumenda nisi minima velit omnis, eum deserunt.</li><li>Dolore labore mollitia rerum est minima quod laudantium alias, temporibus sed perferendis aut asperiores, eligendi nisi similique corporis impedit perspiciatis doloribus dolorum sit? Corrupti necessitatibus nulla alias dolore, molestias cum. Exercitationem deleniti officia, suscipit eligendi a possimus at tempora, iusto animi culpa ducimus magni sapiente, dolor vitae veritatis magnam. Dolores, doloribus nulla rerum veniam deleniti beatae voluptate explicabo asperiores nam.</li><li>Perspiciatis harum sint cupiditate reprehenderit nisi. Tenetur ipsam alias fugit! Quis aperiam porro facilis ipsum quos a voluptas exercitationem provident totam. Impedit, pariatur. Molestiae possimus ut quo dolor ipsum dicta. Eligendi tempora earum commodi sapiente perspiciatis consequuntur accusantium voluptas atque veritatis, excepturi mollitia nihil, quibusdam dicta est odit vel temporibus. Dolores ipsum sit nobis deleniti suscipit iusto, alias quam optio.</li><li>Voluptas quas aspernatur possimus repudiandae natus rerum deserunt consequatur cumque veniam quaerat eius molestiae iure ullam reprehenderit odit cum, quae earum incidunt voluptate sint. Alias deserunt hic facilis repellat quae. Natus aliquid, ad minus laboriosam corporis veritatis culpa hic repellat aliquam quibusdam delectus dolorum placeat modi. Qui temporibus dolores porro maiores, eius iure. Dignissimos odit architecto libero fuga nesciunt officiis.</li><li>Culpa vitae cumque aliquid sequi repellat fuga, maxime doloremque ut voluptas doloribus architecto a pariatur consequatur. Voluptates sequi cum quod odio in explicabo, vitae, adipisci quam tempore, culpa maiores iste! Natus magnam a minus ad at voluptas quisquam nobis, vero, dolor earum necessitatibus tenetur dicta sit ducimus officia. Sapiente molestiae nostrum voluptatem minima adipisci? Cupiditate dolores doloribus tempora consequuntur nesciunt.</li></ol><p><br></p>"

Business.create(delivery_price: 350, phone: "0123456789", email: "hello@veganwheels.com", about: about, faqs: faqs, terms: terms, privacy: privacy)

puts "finished creating business information"

puts "creating restaurants"

restaurant1 = Restaurant.create(
  name: "Mono",
  street_address: "12 Kings Court",
  city: "Glasgow",
  postcode: "G1 5RB",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "Mono opened in 2002, furnishing Glasgow with a unique and versatile space in which to eat, drink and discover utc music. Over our first decade, we developed a reputation for good beer, good vegan food, good gigs and good times. We are proud of our achievements but we aim to make our second decade even better.",
  phone: "01415532400",
  email: "mono@email.com",
  imagekey: 1,
  website: "http://www.monocafebar.com/",
  admin_user: admin1,
  is_published: true,
  min_spend: 700,
)

restaurant2 = Restaurant.create(
  name: "13th Note",
  street_address: "50-60 King Street",
  city: "Glasgow",
  postcode: "G1 5QT",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "Welcome to The 13th Note Cafe, an independent bar, restaurant and venue in Glasgow’s Merchant City. We cater for a vegan diet – all of our food is ethically sourced and free from animal cruelty – and stock a fine selection of vegan beers, lagers and wines.",
  phone: "01415531638",
  email: "13thnote@email.com",
  imagekey: 2,
  website: "http://13thnote.co.uk/",
  admin_user: admin2,
  is_published: true,
  min_spend: 700,
)

restaurant3 = Restaurant.create(
  name: "The V&V Cafe",
  street_address: "481 Great Western Road",
  city: "Glasgow",
  postcode: "G12 8HL",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "The V&V Cafe on Great Western Road was opened as a vegetarian and vegan cafe, but has relaunched a fully vegan menu in January 2018! The standard menu at the V&V includes several breakfast items, like porridge, yogurt with berries, a VLT sandwich and a vegan sausage bap. For lunch you can choose from a variety of toasties, sandwiches, baked potato, pakora kebab and the signature pakora toastie. Finally, you can also have the soup or the curry of the day, different pies and mediterranean flatbread with all kinds of fillings",
  phone: "01412377902",
  email: "vandv@email.com",
  imagekey: 3,
  website: "https://www.facebook.com/thevandvcafe/",
  admin_user: admin3,
  is_published: true,
  min_spend: 700,
)

restaurant4 = Restaurant.create(
  name: "The Flying Duck",
  street_address: "142 Renfield Street",
  city: "Glasgow",
  postcode: "G2 3AU",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "We are a basement bar, venue and vegan diner tucked  away  in Glasgow’s city centre. Established in 2007, The Duck is an integral part of Glasgow’s underground music, vegan and drinking scene. A sister venue to Stereo, Mono, The Old Hairdressers & The 78, we’re a bit of the black sheep of the family. With a dive bar vibe and food that rivals the biggest Michigan sized portions, we’re throwing a big set of the V’s to the traditional image of 'veganness'.",
  phone: "01415641450",
  email: "flyingduck@email.com",
  imagekey: 4,
  website: "https://www.theflyingduck.org/",
  admin_user: admin4,
  is_published: true,
  min_spend: 700,
)

restaurant5 = Restaurant.create(
  name: "Glasvegan",
  street_address: "50 St Enoch Square",
  city: "Glasgow",
  postcode: "G1 4DH",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "100% plant based fast food in the heart of Glasgow. Sustainable and vegan, so you know you can treat yourself guilt-free!",
  phone: "+447595910074",
  email: "glasvegan@email.com",
  imagekey: 1,
  website: "https://www.facebook.com/theglasvegan/",
  admin_user: admin5,
  is_published: true,
  min_spend: 700,
)

restaurant6 = Restaurant.create(
  name: "Stereo",
  street_address: "22 Renfield Lane",
  city: "Glasgow",
  postcode: "G2 5AR",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "We've been around in Glasgow's city centre since 2007 in our beautiful building designed by the one and only Charles Rennie Mackintosh. Cosily snuggled into Renfield Lane we offer you a range of sensory pleasures! A dedicated vegan bar & kitchen during the day and into the dusty evenings, you'll be amazed by our unbeatable menu, cold beers and varied selection of boozy delights.",
  phone: "01412222254",
  email: "stereo@email.com",
  imagekey: 2,
  website: "https://www.stereocafebar.com/",
  admin_user: admin6,
  is_published: true,
  min_spend: 700,
)

restaurant7 = Restaurant.create(
  name: "The 78",
  street_address: "10-14 Kelvinhaugh Street",
  city: "Glasgow",
  postcode: "G3 8NU",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "Next to its sister establishments Mono, Stereo, The Old Hairdresser’s and The Flying Duck, and it’s utc East-coast cousin Harmonium, The 78 is something of an odd one out. It’s situated in Glasgow’s West End, for one thing – just off Argyle Street in the popular Finnieston neighbourhood. With chunky wooden tables, an open kitchen hatch at one end of the room and an open fire at the other, the atmosphere is cosy and relaxed, as is the service. The bar and kitchen, like the other bars in its stable, are 100% vegan, and the food is delightfully done at prices that buck the trend for the area.",
  phone: "01415765018",
  email: "78@email.com",
  imagekey: 3,
  website: "https://www.the78barandkitchen.com/",
  admin_user: admin7,
  is_published: true,
  min_spend: 700,
)

restaurant8 = Restaurant.create(
  name: "Serenity Now",
  street_address: "380 Great Western Road",
  city: "Glasgow",
  postcode: "G4 9HT",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "Founded in 2017, Serenity Now is a plant-based cafe in Glasgow's West End, focussing on fresh, healthy vegan cuisine, world-class coffee (courtesy of our good friends at Dark Arts) and smoothies that'll knock your socks off. All of our recipes are created by us and cooked from scratch right here in our kitchen, 100% free from animal produce but with plenty of love & care.",
  phone: "01412618065",
  email: "serenitynow@email.com",
  imagekey: 4,
  website: "https://www.serenitynowcafe.com/",
  admin_user: admin8,
  is_published: true,
  min_spend: 700,
)

restaurant9 = Restaurant.create(
  name: "Picnic",
  street_address: "103 Ingram Street",
  city: "Glasgow",
  postcode: "G1 1DX",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "Picnic was established in 2016 by Michelle Morrow to offer a healthy and ethical alternative to other Merchant City eateries. With a focus on fresh, whole, organic food and cruelty free ingredients, Picnic provides its customers with refreshing, delicious food in an airy, stylish and comfortable environment.",
  phone: "01415528788",
  email: "picnic@email.com",
  imagekey: 1,
  website: "http://picnic-cafe.co.uk/",
  admin_user: admin9,
  is_published: true,
  min_spend: 700,
)

restaurant10 = Restaurant.create(
  name: "Soul Kitchen",
  street_address: "973 Sauchiehall Street",
  city: "Glasgow",
  postcode: "G3 7TQ",
  monday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  monday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  tuesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  tuesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  wednesday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  wednesday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  thursday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  thursday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  friday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  friday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  saturday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  saturday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  sunday_opens_at: Time.utc(2000, 1, 1, 10, 00),
  sunday_closes_at: Time.utc(2000, 1, 1, 22, 00),
  about: "We are a 100% plant-based restaurant with health and wellbeing at the heart and soul of everything we do. We were established to bring deliciously healthy plant-based food to Glasgow, unlike anything you have seen before.",
  phone: "01414065292",
  email: "soulkitchen@email.com",
  imagekey: 2,
  website: "https://www.soulfoodkitchen.co.uk/",
  admin_user: admin10,
  stripe_account_id: "acct_1HkXH1CgNgTq7UEf",
  is_onboarded: true,
  is_published: true,
  min_spend: 700,
)

photo1 = URI.open("https://bigseventravel.com/wp-content/uploads/2019/12/oh.jpg")
photo2 = URI.open("https://images.happycow.net/venues/1024/97/42/hcmp97421_380105.jpeg")
photo3 = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/vegetarian-recipe-tomato-cucumber-farro-salad-1567097097.jpg")
photo4 = URI.open("https://www.feastingathome.com/wp-content/uploads/2019/01/collard-greens-wraps-100.jpg")
photo5 = URI.open("https://thebusybaker.ca/wp-content/uploads/2017/11/vegan-chocolate-mousse-cheesecake-fbig4-500x500.jpg")
photo6 = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/11/9c/2b/f3/raw-vegan-spring-rolls.jpg")
photo7 = URI.open("https://www.delishknowledge.com/wp-content/uploads/greengoddessveggiesandwich.jpg")
photo8 = URI.open("https://simple-veganista.com/wp-content/uploads/2012/07/raw-vegan-sushi-rolls-5.jpg")
photo9 = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/11/9c/2b/f3/raw-vegan-spring-rolls.jpg")
photo10 = URI.open("https://i.pinimg.com/originals/4f/88/96/4f8896abe38f2f9d14c724f88023fa7d.jpg")

restaurant1.photo.attach(io: photo1, filename: "vegan1.jpg", content_type: "image/jpg")
restaurant2.photo.attach(io: photo2, filename: "vegan2.jpg", content_type: "image/jpg")
restaurant3.photo.attach(io: photo3, filename: "vegan3.jpg", content_type: "image/jpg")
restaurant4.photo.attach(io: photo4, filename: "vegan4.jpg", content_type: "image/jpg")
restaurant5.photo.attach(io: photo5, filename: "vegan5.jpg", content_type: "image/jpg")
restaurant6.photo.attach(io: photo6, filename: "vegan6.jpg", content_type: "image/jpg")
restaurant7.photo.attach(io: photo7, filename: "vegan7.jpg", content_type: "image/jpg")
restaurant8.photo.attach(io: photo8, filename: "vegan8.jpg", content_type: "image/jpg")
restaurant9.photo.attach(io: photo9, filename: "vegan9.jpg", content_type: "image/jpg")
restaurant10.photo.attach(io: photo10, filename: "vegan10.jpg", content_type: "image/jpg")

puts "finished creating restaurants"

puts "creating sections and menus"

Restaurant.all.each do |restaurant|
  Section.create(name: "Starters", order: 1, restaurant_id: restaurant.id)
  Section.create(name: "Mains", order: 2, restaurant_id: restaurant.id)
  Section.create(name: "Desserts", order: 3, restaurant_id: restaurant.id)
  20.times do |n|
    name = Faker::Food.dish
    price = rand(300..1000).round(-1)
    description = Faker::Lorem.sentence(word_count: 10)
    is_active = true
    section = restaurant.sections.sample
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

puts "creating cart"

cart1 = Cart.create

cart2 = Cart.create

cart3 = Cart.create

puts "creating order item"

OrderItem.create(menu_item: Restaurant.first.menu_items.first, quantity: 1, unit_price: 1000, total_price: 1000, cart: cart1, has_side: false)

OrderItem.create(menu_item: Restaurant.first.menu_items.first, quantity: 1, unit_price: 1000, total_price: 1000, cart: cart2, has_side: false)

OrderItem.create(menu_item: Restaurant.first.menu_items.first, quantity: 1, unit_price: 1000, total_price: 1000, cart: cart3, has_side: false)

puts "creating order"

order = Order.create(checkout_session_id: "123", user: User.first, cart: cart1, order_price: 1000, total_price: 1000, is_assigned: true, state: "paid", delivery_price: Business.first.delivery_price, order_time: Time.current, restaurant: Restaurant.first)

order2 = Order.create(checkout_session_id: "123", user: User.first, cart: cart2, order_price: 1000, total_price: 1000, is_assigned: false, state: "paid", delivery_price: Business.first.delivery_price, order_time: Time.current, restaurant: Restaurant.first)

order3 = Order.create(checkout_session_id: "123", user: User.first, cart: cart3, order_price: 1000, total_price: 1000, is_assigned: false, state: "pending", delivery_price: Business.first.delivery_price, order_time: Time.current, restaurant: Restaurant.first)

puts "creating delivery"

Delivery.create(rider_user: rider2, order: order, is_collected: true, is_delivered: true, time_collected: Time.current - 1.hour, time_delivered: Time.current - 1.hour)
Delivery.create(rider_user: rider2, order: order2, is_collected: true, is_delivered: true, time_collected: Time.current - 2.hours, time_delivered: Time.current - 2.hours)
Delivery.create(rider_user: rider2, order: order3, is_collected: true, is_delivered: true, time_collected: Time.current - 3.hours, time_delivered: Time.current - 3.hours)

puts "finished seeding"
