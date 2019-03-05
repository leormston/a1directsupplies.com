# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!(name: "Grey Scotchbrite", image_url: "greyscotch.jpg", description: "High quality grey Scotchbrite. Pack of 10", part_number: "123456789", price: 100, category: "Abrasives", brand: "unbranded", display: true)
Product.create!(name: "Red Scotchbrite", image_url: "redscotch.jpg", description: "High quality red Scotchbrite. Pack of 10", part_number: "987654321", price: 150, category: "Abrasives", brand: "unbranded", display: true)
Product.create!(name: "Pocket Rocket", image_url: "pocketrocket.jpeg", description: "High quality grey pocket rocket. box of 12", part_number: "123456789", price: 2000, category: "Lubricants", brand: "Pocket Rocket", display: true)
Product.create!(name: "M10 A2 Nut", image_url: "a2-nut.jpg", description: "Sold per 100. Discount may be applied on large purchases", part_number: "987654321", price: 4, category: "Fasteners", brand: "unbranded", display: true)
