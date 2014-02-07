require 'faker'

# 20.times do
#   User.new.tap do |u|
#     u.email = Faker::Internet.email
#     u.caregiver_name = Faker::Name.name
#     u.caregiver_phone = Faker::PhoneNumber.phone_number
#   end
# end

kayla = User.new

20.times do
  kayla.Patient.new.tap do |p|
    p.name = Faker::Name.name
    p.email = Faker::Internet.email
    p.street = Faker::Address.street_address
    p.city = Faker::Address.city
    p.zip = Faker::Address.zip_code
    p.phone = Faker::PhoneNumber.phone_number
    p.condition = Faker::Company.bs
    p.save!
  end
end



