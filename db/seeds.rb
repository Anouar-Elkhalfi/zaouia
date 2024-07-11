# db/seeds.rb
puts "Cleaning database..."
MedicalCare.destroy_all

puts "Creating medical care records..."
medical_cares = [
  { name: "City Hospital", address: "123 Main St, Springfield", rating: 5, phone: "+212612345678" },
  { name: "Downtown Clinic", address: "456 Elm St, Springfield", rating: 4, phone: "+212612345679" },
  { name: "Green Valley Hospital", address: "789 Oak St, Springfield", rating: 3, phone: "0612345678" },
  { name: "Springfield General", address: "101 Maple Ave, Springfield", rating: 4, phone: "0623456789" },
  { name: "Riverside Medical Center", address: "202 Birch Ln, Springfield", rating: 5, phone: "0634567890" },
  { name: "Lakeside Clinic", address: "303 Pine St, Springfield", rating: 3, phone: "0523456789" },
  { name: "Hillside Hospital", address: "404 Cedar Ave, Springfield", rating: 4, phone: "0534567890" },
  { name: "Valley Health Center", address: "505 Spruce Dr, Springfield", rating: 2, phone: "0545678901" },
  { name: "Northside Clinic", address: "606 Willow Rd, Springfield", rating: 3, phone: "0656789012" },
  { name: "Westside Hospital", address: "707 Elmwood St, Springfield", rating: 5, phone: "+212634567890" }
]

medical_cares.each do |attributes|
  medical_care = MedicalCare.create!(attributes)
  puts "Created #{medical_care.name}"
end

puts "Finished!"
