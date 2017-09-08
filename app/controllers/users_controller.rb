class UsersController < ApplicationController
  def index
    if cookies[:user_id].nil?
      render nothing: true, status: :not_found
    end
    begin
      render json: User.where(token: cookies[:user_id]).first
    rescue ActiveRecord::RecordNotFound => ex
      render nothing: true, status: :not_found
    end
  end

  def create
    token = SecureRandom.base64
    user = User.create(token: token, phone: params[:phone], password: params[:password], password_confirmation: params[:password_confirm])
    render json: {
      user: user,
      token: user.token
    }
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
      user.update_attributes(token: SecureRandom.base64)
      render json: {
        user: user,
        token: user.token
      }
    else
      render nothing: true, status: :not_found
    end
  end
end
