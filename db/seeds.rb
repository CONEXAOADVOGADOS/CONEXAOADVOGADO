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

experience = Experience.new(  lawyer_name: "Thai Food",
                              category: "gastronomy",
                              description: "Thai street food festival",
                              OAB: ,
                              price: 15,
                              local: "São Paulo",
                              user: User.all.sample)

file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
experience.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
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
