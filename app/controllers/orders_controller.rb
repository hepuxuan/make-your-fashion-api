class OrdersController < ApplicationController
  def create
    begin
      order = Order.new(user_id: params[:user_id], status: :placed, name: params[:name], address: params[:address], phone: params[:phone], ship_fee: 10, promotion: 7.5)
      order.order_item = params[:order_item].map do |order_item|
        OrderItem.new(item_id: order_item[:item_id], price: order_item[:price], print_front: order_item[:print_front], print_back: order_item[:print_back], img: order_item[:img], size: order_item[:size], qty: order_item[:qty])
      end
      order.save

      render json: order, status: :created
    rescue ActiveRecord::RecordNotFound => ex
      render json: {}, status: :not_found
    end
  end

  def index
    begin
      render json: Order.includes(:order_item).where(user: current_user).order('created_at DESC')
    rescue ActiveRecord::RecordNotFound => ex
      render nothing: true, status: :not_found
    end
  end
end
