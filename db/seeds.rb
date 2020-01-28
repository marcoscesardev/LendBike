# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bike.create!([
  { code: 'BIKE001', situation: 1 },
  { code: 'BIKE002', situation: 1 },
  { code: 'BIKE003', situation: 1 },
  { code: 'BIKE004', situation: 1 },
])

Station.create!([
  { name: 'Garagem', address: 'Prefeitura de Springfield', code: 'GARAGEMPS001', vacancies: 1000 },
  { name: 'Central', address: 'R. Antônio Milena, 1177-1105 - Campos Elísios', code: 'CENTRO002', vacancies: 5 },
  { name: 'Zona Sul I', address: 'Av. Dr. Luís Augusto - Jardim Joquei Clube, 14078-600', code: 'ZONASULI003', vacancies: 5 },
  { name: 'Zona Sul II', address: 'R. Dois, 635-619 - Gomes, 14781-348', code: 'ZONASULI004', vacancies: 2 },
])

User.create!([
  { name: 'Admin', email: 'admin@admin.com', password: '12345678', is_admin: true },
  { name: 'Claudio', email: 'claudio@client.com', password: '12345678' },
  { name: 'Luke', email: 'luke@client.com', password: '12345678' },
  { name: 'José', email: 'jose@client.com', password: '12345678' }
])

Lend.create!([
  { bike_id: 1, user_id: 1, origin_id: 1, destiny_id: 2, start_at: Time.current, end_at: Time.current },
  { bike_id: 1, user_id: 3, origin_id: 2, destiny_id: 3, start_at: Time.current },
  { bike_id: 2, user_id: 2, origin_id: 3, destiny_id: 2, start_at: Time.current }
])
