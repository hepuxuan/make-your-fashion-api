class UsersController < ApplicationController
  def index
    begin
      render json: current_user
    rescue ActiveRecord::RecordNotFound => ex
      render nothing: true, status: :not_found
    end
  end

  def create
    user = User.create(phone: params[:phone], password: params[:password], password_confirmation: params[:password_confirm])
    cookies[:user_id] = user.id
    render json: user
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    user = User.find(params[:id])
    if user.update_attributes(name: params[:name], phone: params[:phone], email: params[:email], address: params[:address])
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  def login
    user = User.find_by_phone(params[:phone])
    if user && user.authenticate(params[:password])
      response.set_cookie 'user_id', user.id
      render json: user
    else
      render nothing: true, status: :not_found
    end
  end

  def logout
    response.set_cookie 'user_id', ''
    render json: {}
  end
end
