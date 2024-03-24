require 'faker'
require "open-uri"

Appointment.destroy_all
Experience.destroy_all
User.destroy_all

User.create!(email: "admin@admin.com", password: "admin123", name: "Admin", cpf: "123.123.123-12", phone: "(12)32123-1231")

7.times do
  name = Faker::Name.name

  User.create!(
    email: "#{name.downcase.gsub(/\s+/, '')}@example.com",
    password: "password",
    name: name,
    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    phone: Faker::PhoneNumber.cell_phone
  )
end

puts "Created #{User.count} users"

# Experiences seed data

experience = Experience.new(  specialty: "Thai Food",
                              category: "gastronomy",
                              description: "Thai street food festival",
                              date: Date.today + 2.weeks,
                              price: 15,
                              local: "São Paulo",
                            user: User.all.sample)

file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
experience.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Cheesemaking",
                             category: "workshops",
                             description: "Artisan cheese creation workshop",
                             date: Date.today + 1.weeks,
                             price: 40,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://www.saveur.com/uploads/2022/08/17/00-BRAZIL-CHEESE-SAVEUR-scaled.jpg?auto=webp&auto=webp&optimize=high&quality=70&width=1440&dpr=2")
experience.photo.attach(io: file, filename: "cheese.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Vineyards",
                             category: "excursions",
                             description: "Wine tasting day trip to vineyards",
                             date: Date.today + 6.weeks,
                             price: 90,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://www.civitatis.com/f/brasil/sao-paulo/excursion-sao-roque-589x392.jpg")
experience.photo.attach(io: file, filename: "wine.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Coffee",
                             category: "workshops",
                             description: "Barista training and coffee tasting",
                             date: Date.today + 3.weeks,
                             price: 30,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://i.shgcdn.com/0f0d3eb1-7d14-4fae-8cbe-5dbb261113bc/-/format/auto/-/preview/3000x3000/-/quality/lighter/")
experience.photo.attach(io: file, filename: "coffee.png", content_type: "image/png")
experience.save!


experience = Experience.new( specialty: "Wine",
                             category: "workshops",
                             description: "Wine tasting",
                             date: Date.today + 2.weeks,
                             price: 30,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://cellaraiders.com/cdn/shop/articles/wine-tasting-013120_2048x.jpg?v=1580495941")
experience.photo.attach(io: file, filename: "winet.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Churros",
                             category: "gastronomy",
                             description: "Churros and chocolate festival",
                             date: Date.today + 4.weeks,
                             price: 10,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://ograndeabc.com.br/wp-content/uploads/2022/09/Festival-do-Morango-Churros-Chocolate-Foto-Helber-Aggio_PSA-7.jpeg")
experience.photo.attach(io: file, filename: "churros.png", content_type: "image/png")
experience.save!


experience = Experience.new( specialty: "Farmer's Market",
                             category: "gastronomy",
                             description: "Weekly outdoor farmer's market",
                             date: Date.today + 1.weeks,
                             price: 100,
                             local: "São Paulo",
                             user: User.all.sample)
                            #
file = URI.open("https://traveler.marriott.com/wp-content/uploads/2016/12/ALMY_F7B7X6_HippyMarket.jpg?1481222838")
experience.photo.attach(io: file, filename: "farmer.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Cooking Class",
                             category: "workshops",
                             description: "Brazilian dishes cooking workshop",
                             date: Date.today + 3.weeks,
                             price: 50,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://hare-media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/2e/72/6e.jpg")
experience.photo.attach(io: file, filename: "cooking.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Fusion Asian Food",
                             category: "gastronomy",
                             description: "Fusion food of Roy Yamaguchi, doing a tour in Brazil, with special dishes from all regions of Japan",
                             date: Date.today + 3.weeks,
                             price: 50,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://static.themoscowtimes.com/image/article_1360/22/dc8d7df191694a5db5924e43e5e68f7d.jpeg")
experience.photo.attach(io: file, filename: "faf.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Hidden Gems",
                             category: "excursions",
                             description: "Walking tour of under the radar historical spots in São Paulo",
                             date: Date.today + 1.weeks,
                             price: 30,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtp2h6K8suhjRDNgK3h-5WCVP8YhdHvZ2iqPWOyerpsn4mEvnkP_di7AFzjr8xBqHAwyc&usqp=CAU")
experience.photo.attach(io: file, filename: "historical.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Street Art",
                             category: "excursions",
                             description: "Urban artwork walking tour and live mural painting",
                             date: Date.today + 1.weeks,
                             price: 20,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKjogfFF8dnai7lVyKrB9uZlOr0z6ubmTN_kvlrIxF9bPPr8qPfCNTDpXxLMkR-M59xPI&usqp=CAU")
experience.photo.attach(io: file, filename: "artwork.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Day Trip",
                             category: "excursions",
                             description: "Day trip to a coffee farm outside the city with tasting and lunch",
                             date: Date.today + 3.weeks,
                             price: 25,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://hare-media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/15/54/ac.jpg")
experience.photo.attach(io: file, filename: "cf.png", content_type: "image/png")
experience.save!

puts "Created #{Experience.count} experiences"

# Appointments seed data

8.times do
  appointment = Appointment.create(
    experience: Experience.all.sample,
    user: User.all.sample
  )
end

puts "Created #{Appointment.count} appointments"
puts "Seed data for Users, Events and Appointments created successfully."
