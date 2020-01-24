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
num_of_stroller = 80


firstname = []
lastname = []
address = []

File.readlines('db/seed_data/firstname.txt').each do |line|
  firstname << line.chomp
end

File.readlines('db/seed_data/lastname.txt').each do |line|
  lastname << line.chomp
end

File.readlines('db/seed_data/address.txt').each do |line|
  address << line.chomp
end

User.create!(
    email: "test@test.com",
    first_name: firstname.sample.capitalize,
    last_name: lastname.sample.upcase,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{address.sample} France",
    password:  '123456',
    password_confirmation: '123456',
    bio: Faker::Quote.most_interesting_man_in_the_world,
  )

number_of_users.times do
  print "."
  User.create!(
    email: Faker::Internet.email,
    first_name: firstname.sample.capitalize,
    last_name: lastname.sample.upcase,
    phone: Faker::PhoneNumber.cell_phone,
    address: "#{address.sample} France",
    password:  'secret',
    password_confirmation: 'secret',
    bio: Faker::Quote.most_interesting_man_in_the_world,
  )
end

puts ""
puts "Erase all Item data"
Item.destroy_all

category = [ "2 places", "3 places", "3 roues", "Bagage cabine", "Canne" ]

tag =["Stylée", "Maniable", "Esthetique", "Sportive", "Citadine", "Polyvalente",
      "Tout-terrain", "0-6 mois", "6+ mois", "Bagage cabine"]

#Scrape a stroller title:

url = "https://www.natalys.com/balade/poussette?srule=price-high-to-low&start=0&sz=#{num_of_stroller}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.search('.link').each do |element|
  print '.'
  e = element.text.strip.split(':')

    Item.create!(
    title: e[0],
    category: category.sample,
    tag: tag.sample,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price_in_cents: rand(500..1500),
    address: "#{address.sample} France",
    availability: [true, false].sample,
    start_date: Faker::Date.in_date_period(year: 2019, month: rand(1..12)),
    end_date: Faker::Date.in_date_period(year: 2020, month: rand(1..12)),
    user: User.all.sample,
  )
end

#correct bad Geolocalisation

bad_geoloc = Item.where(longitude: nil)
bad_geoloc.each do |item|
  item.destroy
end
