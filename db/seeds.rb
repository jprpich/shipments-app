Vendor.destroy_all
Order.destroy_all
Location.destroy_all 
Delivery.destroy_all 


random_latitude = 51.501564
random_longitude = -0.141944
10.times do 
  Location.create(city: Faker::Address.city,  latitude: random_latitude,longitude: random_longitude)
  random_latitude += 0.05
  random_longitude -= 0.01
end

10.times do 
  Vendor.create(name: Faker::Company.name)
end

Vendor.pluck(:id).each do |vendor_id| 
  Location.pluck(:id).each do |location_id| 
    random_time = (rand * 10) + 1
    Delivery.create(vendor_id: vendor_id, location_id: location_id, normal_time: random_time)
  end
end

30.times do 
  random_day = (rand * 27).to_i + 1
  random_date = Date.new(2019, 2, random_day)
  random_delivery_time = (rand * 10).to_i + 1
  Order.create(
    address: Faker::Address.street_address, 
    location_id: Location.pluck(:id).sample,
    number: Faker::PhoneNumber.subscriber_number(10), 
    tracking_number: Faker::PhoneNumber.subscriber_number(10), 
    vendor_id: Vendor.pluck(:id).sample, 
    shipped_at: random_date, 
    delivered_at: random_date + random_delivery_time
  )
end
