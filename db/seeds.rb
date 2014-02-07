require 'faker'

kayla = User.new
kayla.caregiver_name = "Kayla Morrison"
kayla.caregiver_phone = "541-408-0887"
kayla.email = 'kaylas.email.address@gmail.com'
kayla.password = 'password'
kayla.password_confirmation = 'password'
kayla.save

20.times do
  Patient.new.tap do |p|
    p.name = Faker::Name.name
    p.email = Faker::Internet.email
    p.street = Faker::Address.street_address
    p.city = Faker::Address.city
    p.zip = Faker::Address.zip_code
    p.phone = Faker::PhoneNumber.phone_number
    p.condition = Faker::Company.bs
    p.checkintime = Time.new(2000)
    kayla.patients << p
    p.save!
  end
end

kayla.patients.each do |p|
  5.times do
    p.checkins << Checkin.new(message: Faker::Lorem.sentence)
  end
end
