# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bike.create!([
  { code: 'BIKE001' },
  { code: 'BIKE002' },
  { code: 'BIKE003', maintenance: true },
  { code: 'BIKE004' },
])

Station.create!([
  { name: 'Garagem', address: 'Prefeitura de Springfield', code: 'GARAGEMPS001', vacancies: 1000 },
  { name: 'Central', address: 'R. Antanio Milena, 1177-1105 - Campos Elisios', code: 'CENTRO002', vacancies: 5 },
  { name: 'Zona Sul I', address: 'Av. Dr. Luis Augusto - Jardim Joquei Clube, 14078-600', code: 'ZONASULI003', vacancies: 5 },
  { name: 'Zona Sul II', address: 'R. Dois, 635-619 - Gomes, 14781-348', code: 'ZONASULI004', vacancies: 2 },
])

User.create!([
  { name: 'Admin', email: 'admin@admin.com', password: '12345678', is_admin: true },
  { name: 'Claudio', email: 'claudio@client.com', password: '12345678' },
  { name: 'Luke', email: 'luke@client.com', password: '12345678' },
  { name: 'Jose', email: 'jose@client.com', password: '12345678' },
])

Lend.create!([
  { bike_id: 1, user_id: 1, start_at: Time.current },
  { bike_id: 1, user_id: 3, start_at: Time.current },
  { bike_id: 2, user_id: 2, start_at: Time.current },
])
