# db/seeds.rb
puts "Cleaning database..."
MedicalCare.destroy_all
  
puts "Creating medical care records..."
medical_cares = [
  { name: "City Hospital", address: "123 Main St, Springfield", rating: 5, phone: "123-456-7890" },
  { name: "Downtown Clinic", address: "456 Elm St, Springfield", rating: 4, phone: "098-765-4321" },
  { name: "Green Valley Hospital", address: "789 Oak St, Springfield", rating: 3, phone: "555-123-4567" },
  { name: "Springfield General", address: "101 Maple Ave, Springfield", rating: 4, phone: "555-765-4321" },
  { name: "Riverside Medical Center", address: "202 Birch Ln, Springfield", rating: 5, phone: "555-456-7890" },
  { name: "Lakeside Clinic", address: "303 Pine St, Springfield", rating: 3, phone: "555-654-3210" },
  { name: "Hillside Hospital", address: "404 Cedar Ave, Springfield", rating: 4, phone: "555-321-6543" },
  { name: "Valley Health Center", address: "505 Spruce Dr, Springfield", rating: 2, phone: "555-789-0123" },
  { name: "Northside Clinic", address: "606 Willow Rd, Springfield", rating: 3, phone: "555-890-1234" },
  { name: "Westside Hospital", address: "707 Elmwood St, Springfield", rating: 5, phone: "555-234-5678" }
]

medical_cares.each do |attributes|
  medical_care = MedicalCare.create!(attributes)
  puts "Created #{medical_care.name}"
end

puts "Finished!"
