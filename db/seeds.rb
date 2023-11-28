require 'faker'

Experience.destroy_all
User.destroy_all

User.create!(email: "admin@admin.com", password: "admin123", name: "Admin", cpf: "123.123.123-12", phone: "(12)32123-1231")

6.times do
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

experiences = [{
    specialty: "Thai Food",
    category: "gastronomy",
    description: "Thai street food festival",
    date: Date.today + 2.weeks,
    price: 15,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Cheesemaking",
    category: "workshop",
    description: "Artisan cheese creation workshop",
    date: Date.today + 1.month,
    price: 40,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Vineyards",
    category: "excursion",
    description: "Wine tasting day trip to vineyards",
    date: Date.today + 6.weeks,
    price: 90,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Coffee",
    category: "workshop",
    description: "Barista training and coffee tasting",
    date: Date.today + 3.weeks,
    price: 30,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Churros",
    category: "gastronomy",
    description: "Churros and chocolate festival",
    date: Date.today + 4.weeks,
    price: 10,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Farmer's Market",
    category: "gastronomy",
    description: "Weekly outdoor farmer's market",
    date: Date.today + 1.week,
    price: 100,
    local: "São Paulo",
    user: User.all.sample
  },
  {
    specialty: "Cooking Class",
    category: "workshop",
    description: "Brazilian dishes cooking workshop",
    date: Date.today + 3.months,
    price: 50,
    local: "São Paulo",
    user: User.all.sample
  }]

  experiences.each do |experience|
    Experience.create!(experience)
  end

puts "Created #{Experience.count} experiences"

# Appointments seed data

7.times do
  appointment = Appointment.create(
    experience: Experience.all.sample,
    user: User.all.sample
  )
end

puts "Created #{Appointment.count} appointments"
puts "Seed data for Users, Events and Appointments created successfully."
