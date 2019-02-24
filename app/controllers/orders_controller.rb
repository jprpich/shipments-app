class OrdersController < ApplicationController 

  def index
    @orders = Order.all.includes(:vendor, :location) 
    @deliveries = Delivery.all
  end

  def new
    @order = Order.new 
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_url
    else
      flash.now[:errors] = @order.errors.full_messages
      render :new 
    end
  end

  private 
  def order_params
    params.require(:order).permit(:number, :tracking_number, :address, :shipped_at, :delivered_at, :vendor_id, :location_id)
  end

end