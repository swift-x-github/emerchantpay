# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#  Character.create(name: "Luke", movie: movies.first)


  Client.create!(
    customer_email: "client@yahoo.com", balance: 1000,
    customer_phone: "0442300505"
    )

  Merchant.create!(
    name: "merchant_hotel", balance: 1000, 
    email: "merchant@yahoo.com", status: :active
  )

  Admin.create!(
    name: "admin_user", balance: 1000, email: "admin@yahoo.com",
    status: :active
  )

#   Authorize.create!(
#     user_id: Merchant.last.id, amount: 100,
#     customer_email: Client.last.customer_email,
#     customer_phone: Client.last.customer_phone,
#     notification_url: "http://localhost:3000/api/clients"
#   )