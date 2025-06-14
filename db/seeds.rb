# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!({
    email: 'test1@gmail.com',
    password: '123456'
})


10.times do |i|
    property =Property.create!({
        name: Faker::Lorem.unique.sentence(word_count: 3),
        description: Faker::Lorem.paragraph(sentence_count: 10),
        headline: Faker::Lorem.unique.sentence(word_count: 6),
        address_1: Faker::Address.street_address,
        address_2: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        price: Money.from_amount((50..100).to_a.sample,'USD'),
    })
    property.images.attach(io: File.open("db/images/property_#{i + 1}.jpeg"), filename: "property.name")
    property.images.attach(io: File.open("db/images/property_11.jpeg"), filename: "property.name")
    property.images.attach(io: File.open("db/images/property_15.jpeg"), filename: "property.name")
    property.images.attach(io: File.open("db/images/property_18.jpeg"), filename: "property.name")
    property.images.attach(io: File.open("db/images/property_19.jpeg"), filename: "property.name")
    property.images.attach(io: File.open("db/images/property_20.jpeg"), filename: "property.name")
    ((5..10).to_a.sample).times do
        Review.create!({
            content: Faker::Lorem.paragraph(sentence_count: 10),
            cleanliness_rating: (1..5).to_a.sample,
            accuracy_rating: (1..5).to_a.sample,
            communication_rating: (1..5).to_a.sample,
            location_rating: (1..5).to_a.sample,
            value_rating: (1..5).to_a.sample,
            property: property,
            user: user
        })
    end
end