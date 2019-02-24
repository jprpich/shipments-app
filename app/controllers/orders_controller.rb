class OrdersController < ApplicationController 

  def index
    @deliveries = Delivery.all
    if params[:number].present? 
      @orders = Order.by_number(params[:number]).includes(:vendor, :location)
    elsif params[:address].present?
      @orders = Order.by_address(params[:address]).includes(:vendor, :location)
    elsif params[:vendor_id].present? 
      @orders = Order.by_vendor(params[:vendor_id]).includes(:vendor, :location)
    else
      @orders = Order.all.includes(:vendor, :location) 
    end
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