require 'csv'

task :import => [:environment] do

  merchants = "./db/data/merchants.csv"

  CSV.foreach(merchants, :headers => :true) do |row|
    m = Merchant.new
    m.name = row['name']
    m.created_at = row['created_at']
    m.updated_at = row['updated_at']
    m.save!
  end

  customers = "./db/data/customers.csv"

  CSV.foreach(customers, :headers => :true) do |row|
    c = Customer.new
    c.first_name = row['first_name']
    c.last_name = row['last_name']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save!
  end

  items = "./db/data/items.csv"

  CSV.foreach(items, :headers => :true) do |row|
    i = Item.new
    i.name = row['name']
    i.description = row['description']
    i.unit_price = row['unit_price']
    i.merchant_id = row['merchant_id']
    i.created_at = row['created_at']
    i.updated_at = row['updated_at']
    i.save!
  end

end