puts "Seeding Data!"

puts "Deleting old data..."

Order.destroy_all
Customer.destroy_all
Coffee.destroy_all
# Order.destroy_all

puts "Done deleting data..."


puts "Creating Data..."

5.times do
  Customer.create(name: Faker::Name.name)
end

5.times do
  Coffee.create(title: Faker::Coffee.blend_name)
end

25.times do
  Order.create(price: rand(1..12), customer_id: Customer.ids.sample, coffee_id: Coffee.ids.sample)
end

puts "Done Seeding Data!"