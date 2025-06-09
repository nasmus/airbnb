# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Property.create!({
    name: 'appartment in gulshan thana',
    description: 'Stylish & Luxurious 2-Bedroom Apartment!
This modern, air-conditioned apartment offers comfort for 4 guests with spacious bedrooms, attached & ',
    headline:'Home Away From Home',
    address_1:'uttara sector-7 road -12',
    address_2:'uttara sector-11 road -14',
    city:'bogura',
    state:'bogura sodor ',
    country:'bangladesh'

})