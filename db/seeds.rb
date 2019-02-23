Vendor.destroy_all
Order.destroy_all

100.times do 
  Vendor.create(name: Faker::Company.name)
end




1000.times do 
  random_day = (rand * 27).to_i + 1
  random_date = Date.new(2019, 2, random_day)
  random_delivery_time = (rand * 10).to_i + 1
  Order.create(
    address: Faker::Address.full_address, 
    number: Faker::PhoneNumber.subscriber_number(10), 
    tracking_number: Faker::PhoneNumber.subscriber_number(10), 
    vendor_id: Vendor.all.sample.id, 
    shipped_at: random_date, 
    delivered_at: random_date + random_delivery_time
  )
end
