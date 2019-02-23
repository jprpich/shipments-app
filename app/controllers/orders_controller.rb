class OrdersController < ApplicationController 

  def index
    @orders = Order.all 
  end

  def new
    @order = Order.new 
  end

  def show 
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_url(@order) 
    else
      flash.now[:errors] = @order.errors.full_messages
      render :new 
    end
  end

  private 
  def order_params
    params.require(:order).permit(:number, :tracking_number, :address, :shipped_at, :delivered_at, :vendor_id)
  end

end