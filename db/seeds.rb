Vendor.destroy_all
Order.destroy_all
Location.destroy_all 
Delivery.destroy_all 

10.times do 
  Location.create(city: Faker::Address.city)
end

10.times do 
  Vendor.create(name: Faker::Company.name)
end

Vendor.all.each do |vendor| 
  Location.all.each do |location| 
    random_time = (rand * 10) + 1
    Delivery.create(vendor_id: vendor.id, location_id: location.id, normal_time: random_time)
  end
end

30.times do 
  random_day = (rand * 27).to_i + 1
  random_date = Date.new(2019, 2, random_day)
  random_delivery_time = (rand * 10).to_i + 1
  Order.create(
    address: Faker::Address.street_address, 
    location_id: Location.all.sample.id,
    number: Faker::PhoneNumber.subscriber_number(10), 
    tracking_number: Faker::PhoneNumber.subscriber_number(10), 
    vendor_id: Vendor.all.sample.id, 
    shipped_at: random_date, 
    delivered_at: random_date + random_delivery_time
  )
end
