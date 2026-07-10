# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

Asset.destroy_all
Park.destroy_all
District.destroy_all

park_csv_file = Rails.root.join('db/ParksAndOpenSpaceData.csv')
park_asset_csv_file = Rails.root.join('db/ParkAssetInventoryData.csv')

park_data = File.read(park_csv_file)
park_asset_data = File.read(park_asset_csv_file)

parks = CSV.parse(park_data, headers: true)
assets =  CSV.parse(park_asset_data, headers: true)

parks.each do |park|
    district = District.find_or_create_by!(district_name: park['District'])

    Park.create!(park_id: park['Park ID'],
        park_name: park['Park Name'],
        location_description: park['Location Description'],
        park_category: park['Park Category'],
        district: district
    )
end

assets.each do |asset|
    park = Park.find_by(park_id: asset['Park ID'])
    next unless park

    Asset.create!(asset_id: asset['Asset ID'],
        park: park,
        asset_class: asset['Asset Class'],
        asset_type: asset['Asset Type'],
        asset_size: asset['Asset Size']
    )
end
