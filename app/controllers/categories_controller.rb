class CategoriesController < ApplicationController
  def index
    render json: {
      categories: Category.limit(100)
    }
  end
end
