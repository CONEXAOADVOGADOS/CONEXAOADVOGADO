require 'faker'

# Limpar os dados existentes
Connection.destroy_all
Lawyer.destroy_all
User.destroy_all

# Criar usuário administrador
User.create!(email: "admin@admin.com", password: "admin123", name: "Admin", CPF: "123.123.123-12", phone_number: "(12)32123-1231")

# Criar usuários aleatórios
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password", # Senha padrão para simplificar
    name: Faker::Name.name,
    CPF: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts "Created #{User.count} users"

# Criar advogados
advogado = Lawyer.new(
    name: User.pluck(:name).sample,
    email: User.pluck(:email).sample,
    city: "Conexão Advogados",
    state: 
    category: "Direito Civil",
    description: "Advogado especializado em casos de direito civil, com experiência em contratos e responsabilidade civil.",
    phone: "(11) 1234-5678",
    OAB: "12345/SP",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Maria Oliveira",
    category: "Direito Trabalhista",
    description: "Advogada com vasta experiência em direito trabalhista, atuando em causas trabalhistas e rescisões contratuais.",
    phone: "(11) 2345-6789",
    mail: "maria.oliveira@example.com",
    OAB: "54321/RJ",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Pedro Santos",
    category: "Direito Penal",
    description: "Advogado especializado em direito penal, com foco em crimes contra a pessoa e crimes contra o patrimônio.",
    phone: "(11) 3456-7890",
    mail: "pedro.santos@example.com",
    OAB: "67890/MG",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Ana Rodrigues",
    category: "Direito de Família",
    description: "Advogada com experiência em direito de família, atuando em divórcios, pensões alimentícias e guarda de filhos.",
    phone: "(11) 4567-8901",
    mail: "ana.rodrigues@example.com",
    OAB: "54321/RS",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Carlos Lima",
    category: "Direito do Consumidor",
    description: "Advogado especializado em direito do consumidor, com experiência em casos de relação de consumo e direitos básicos do consumidor.",
    phone: "(11) 5678-9012",
    mail: "carlos.lima@example.com",
    OAB: "98765/BA",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Mariana Almeida",
    category: "Direito Tributário",
    description: "Advogada tributarista com conhecimento em legislação fiscal e resolução de questões relacionadas a tributos.",
    phone: "(11) 6789-0123",
    mail: "mariana.almeida@example.com",
    OAB: "54321/SC",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Paulo Costa",
    category: "Direito Ambiental",
    description: "Advogado com experiência em direito ambiental, atuando em casos de licenciamento ambiental e crimes ambientais.",
    phone: "(11) 7890-1234",
    mail: "paulo.costa@example.com",
    OAB: "54321/PR",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Sandra Santos",
    category: "Direito Empresarial",
    description: "Advogada com foco em direito empresarial, atuando em casos de contratos comerciais e consultoria jurídica para empresas.",
    phone: "(11) 8901-2345",
    mail: "sandra.santos@example.com",
    OAB: "54321/PE",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Roberto Ferreira",
    category: "Direito Imobiliário",
    description: "Advogado especializado em direito imobiliário, com experiência em transações imobiliárias e regularização de imóveis.",
    phone: "(11) 9012-3456",
    mail: "roberto.ferreira@example.com",
    OAB: "54321/AM",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Fernanda Lima",
    category: "Direito Internacional",
    description: "Advogada com conhecimento em direito internacional, atuando em casos de conflitos entre leis de diferentes países.",
    phone: "(11) 0123-4567",
    mail: "fernanda.lima@example.com",
    OAB: "54321/GO",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    lawyer_name: "Ricardo Oliveira",
    category: "Direito Administrativo",
    description: "Advogado especializado em direito administrativo, com experiência em processos envolvendo órgãos públicos e licitações.",
    phone: "(11) 1234-5678",
    mail: "ricardo.oliveira@example.com",
    OAB: "54321/ES",
    user: User.all.sample)

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!


# advogados.each do |advogado|
#   Lawyer.find_or_create_by!(
#     lawyer_name: advogado[:nome],
#     category: advogado[:especialidade],
#     description: advogado[:descricao],
#     phone: advogado[:telefone],
#     mail: advogado[:email],
#     OAB: advogado[:oab]
#   )
# end

puts "Created #{Lawyer.count} lawyers"

# Criar connections associados a usuários existentes

8.times do
  connection = Connection.create!(
    lawyer: Lawyer.all.sample,
    user: User.all.sample
  )
  # puts "Created connection for user #{user}"
end

puts "Created #{Connection.count} connections"
puts "Seed data for Users, Lawyers, and Connections created successfully."
