class ProductsController < ApplicationController
  def show
    begin
      render json: Product.includes({design_detail: :design}, :text_detail).find(params[:id])
    rescue ActiveRecord::RecordNotFound => ex
      render nothing: true, status: :not_found
    end
  end

  def index
    if params[:catagory].present?
      render json: {
        products: Product.where(category_id: params[:catagory])
      }
    elsif params[:campaign].present?
      render json: {
        products: Product.where(campaign_id: params[:campaign])
      }
    else
      render json: {
        products: Product.limit(100)
      }
    end
  end
end
