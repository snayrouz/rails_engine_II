require 'csv'

namespace :import_csv do

  puts "Begin seeding..."

  task customers: :environment do
    csv_text = File.read('./db/data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end

  puts "Seeded customers!"

  task merchants: :environment do
    csv_text = File.read('./db/data/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end

  puts "Seeded merchants!"

  task invoices: :environment do
    csv_text = File.read('./db/data/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create!(row.to_hash)
    end
  end

  puts "Seeded invoices!"

  task items: :environment do
    csv_text = File.read('./db/data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end
  end

  puts "Seeded items!"

  task all: [:customers, :merchants, :invoices, :items]

  puts "Successfully seeded database. Open up the rails console!"
end
