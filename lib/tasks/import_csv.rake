require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

namespace :import_csv do

  task merchants: :environment do
    csv_text = File.read('./data/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end

  task items: :environment do
    csv_text = File.read('./data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end
  end

  task customers: :environment do
    csv_text = File.read('./data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end

  task all: [:merchants, :items, :customers]
end