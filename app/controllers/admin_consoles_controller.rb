class AdminConsolesController < ApplicationController
  def index
    @orders = Order.includes(:order_item).where({status: :placed}).order('created_at DESC')
  end
end
