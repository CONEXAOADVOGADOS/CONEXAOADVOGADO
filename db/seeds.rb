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

experience = Experience.new( specialty: "Thai Food",
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

file = URI.open("https://scontent.fcgh14-1.fna.fbcdn.net/v/t39.30808-6/344564697_227287006570376_8646691821337860781_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=173fa1&_nc_eui2=AeG_dgydbPoZvYnOaNRV-4o7Wc-vGxciy79Zz68bFyLLvxyCbRCdSVr2W3FfwMSAqY2K3G9_H_goRhExWv2b-v1z&_nc_ohc=LZO7PVlr-nUAX_lGCZy&_nc_ht=scontent.fcgh14-1.fna&oh=00_AfBqZwvaXXc-t6VMObHcJws2rrh0G4mOEgFMvpPhgy1okA&oe=6574185E")
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
experience.photo.attach(io: file, filename: "winet.png", content_type: "image/png")
experience.save!


experience = Experience.new( specialty: "Farmer's Market",
                             category: "gastronomy",
                             description: "Weekly outdoor farmer's market",
                             date: Date.today + 1.weeks,
                             price: 100,
                             local: "São Paulo",
                             user: User.all.sample)
                            #  https://traveler.marriott.com/wp-content/uploads/2016/12/ALMY_F7B7X6_HippyMarket.jpg?1481222838
file = URI.open("https://res.cloudinary.com/dop9mb8rc/image/upload/v1701794577/captura_de_tela_de_2023-12-05_13-31-04_lc1z2l.png")
experience.photo.attach(io: file, filename: "winet.png", content_type: "image/png")
experience.save!

experience = Experience.new( specialty: "Cooking Class",
                             category: "workshops",
                             description: "Brazilian dishes cooking workshop",
                             date: Date.today + 3.weeks,
                             price: 50,
                             local: "São Paulo",
                             user: User.all.sample)

file = URI.open("https://www.civitatis.com/f/brasil/rio-de-janeiro/galeria/clase-de-cocina-brasilena-8.jpg")
experience.photo.attach(io: file, filename: "winet.png", content_type: "image/png")
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
