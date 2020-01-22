# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require 'faker'

puts "Erase all User data"
User.destroy_all

number_of_users = 30
num_of_stroller = 77


firstname = []
lastname = []
address = []

File.readlines('firstname.txt').each do |line|
  firstname << line
end

File.readlines('lastname.txt').each do |line|
  lastname << line
end

File.readlines('address.txt').each do |line|
  address << line
end


number_of_users.times do
  print "."
  User.create!(
    email: Faker::Internet.email,
    first_name: firstname.sample,
    last_name: lastname.sample,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{address.sample} France",
    password:  'secret',
    password_confirmation: 'secret',
  )
end

puts "Erase all Item data"
Item.destroy_all

category = [ "Canne", "Transformable", "3 places",
             "Bagage cabine", "3 Roues", "1 place", "2 places"]

tag =["Stylée", "Maniable", "Esthetique", "Sportive", "Citadine", "Polyvalente",
      "Tout-terrain", "0-6 mois", "6+ mois"]

#Scrape a stroller title:

url = "https://www.natalys.com/balade/poussette?srule=price-high-to-low&start=0&sz=#{num_of_stroller}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

user_offset = rand(User.count)

html_doc.search('.link').each do |element|
  print '.'
  e = element.text.strip.split(':')

    Item.create!(
    title: e[0],
    category: category.sample,
    tag: tag.sample,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price_in_cents: rand(500..1500),
    address: "#{Faker::Address.street_address}, #{Faker::Address.zip_code} #{Faker::Address.state}",
    availability: [true, false].sample,
    start_date: Faker::Date.in_date_period(year: 2019, month: rand(1..12)),
    end_date: Faker::Date.in_date_period(year: 2020, month: rand(1..12)),
    latitude: rand(41.00..50.00),
    longitude: rand(0.20..7.00),
    user: User.all.sample
  )
end
