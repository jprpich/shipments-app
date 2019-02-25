module OrdersHelper
  def current_delivery_time(order) 
    (order.delivered_at - order.shipped_at).to_i
  end

  def normal_time(deliveries, order)
     deliveries.find_by(location_id: order.location.id, vendor_id: order.vendor.id).normal_time 
  end
end
