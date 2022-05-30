# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Type.destroy_all
Brand.destroy_all
Product.destroy_all

User.create([{id: 1, email: "admin@example.com", username: "admin", admin: true, password: "admin1234"},
             {id: 2, email: "example@example.com", username: "example", admin: false, password: "example1234"}])

Type.create([   {id: 1, byType: "Android"},
                {id: 2, byType: "Laptop"}])

Brand.create([   {id: 1, byBrand: "Xiaomi"},
                {id: 2, byBrand: "Samsung"},
                {id: 3, byBrand: "Asus"}])

Product.create( [{name: "Redmi Note 8",         type_id: 1, brand_id: 1, stock: 10, price: 2000000},
                {name: "Samsung Galaxy Note 7", type_id: 1, brand_id: 2, stock: 5,  price: 2000000},
                {name: "MI 10",                 type_id: 1, brand_id: 1, stock: 5,  price: 10000000},
                {name: "Asus TUF FX504GD",      type_id: 2, brand_id: 3, stock: 5,  price: 15000000},
                {name: "Samsung J2 Prime",      type_id: 1, brand_id: 2, stock: 10, price: 1000000}])

p "Created #{User.count} user #{Type.count} type #{Brand.count} brand #{Product.count} produk"