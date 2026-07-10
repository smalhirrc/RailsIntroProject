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
District.destroy_all
Park.destroy_all

park_csv_file = Rails.root.join('db/ParksAndOpenSpaceData.csv')
park_asset_csv_file = Rails.root.join('db/ParkAssetInventoryData.csv')

park_data = File.read(park_csv_file)
park_asset_data = File.read(park_asset_csv_file)

parks = CSV.parse(park_data, headers: true)
assets =  CSV.parse(park_asset_data, headers: true)