require 'faker'

# Limpar os dados existentes
Connection.destroy_all
Lawyer.destroy_all
User.destroy_all

# Criar usuário administrador
User.create!(email: "admin@admin.com", password: "admin123", first_name: "Admin", surname: "123", CPF: "123.123.123-12", phone_number: "(12)32123-1231")

# Criar usuários aleatórios
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password", # Senha padrão para simplificar
    first_name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    CPF: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts "Created #{User.count} users"

# Criar advogados
advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "12345/SP",
    group: ["Advocacia"],
    category: ["Direito Administrativo"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado especializado em casos de direito civil, com experiência em contratos e responsabilidade civil.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/RJ",
    group: ["Advocacia"],
    category: ["Direito Administrativo"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado especializado em casos de direito civil, com experiência em contratos e responsabilidade civil.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "67890/MG",
    group: ["Advocacia"],
    category: ["Direito Penal"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado especializado em direito penal, com foco em crimes contra a pessoa e crimes contra o patrimônio.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/RS",
    group: ["Advocacia"],
    category: ["Direito de Família e Sucessões"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogada com experiência em direito de família, atuando em divórcios, pensões alimentícias e guarda de filhos.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "98765/BA",
    group: ["Advocacia"],
    category:["Direito do Consumidor"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado especializado em direito do consumidor, com experiência em casos de relação de consumo e direitos básicos do consumidor.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/SC",
    group: ["Advocacia"],
    category: ["Direito Tributário"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogada tributarista com conhecimento em legislação fiscal e resolução de questões relacionadas a tributos.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/PR",
    group: ["Advocacia"],
    category: ["Direito Ambiental"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado com experiência em direito ambiental, atuando em casos de licenciamento ambiental e crimes ambientais.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/PE",
    group: ["Advocacia"],
    category: ["Direito Empresarial"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogada com foco em direito empresarial, atuando em casos de contratos comerciais e consultoria jurídica para empresas.",
    status: "Aguardando aprovação")

    file = URI.open("https://foodmagazine.com.br/imagens/noticias/butatan_food_park.jpg")
    advogado.photo.attach(io: file, filename: "thai.png", content_type: "image/png")
    advogado.save!

advogado = Lawyer.new(
    user_id: User.all.sample.id,
    city: "Conexão Advogados",
    UF: "Conexão Advogados",
    OAB: "54321/ES",
    group: ["Advocacia"],
    category: ["Direito Administrativo"],
    faculty: "Faculdade de Direito da USP",
    detail: "Advogado especializado em direito administrativo, com experiência em processos envolvendo órgãos públicos e licitações.",
    status: "Aguardando aprovação")

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
