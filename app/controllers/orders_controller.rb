require('mini_magick')
require 'aliyun/oss'

class OrdersController < ApplicationController
  def create
    begin
      order = Order.new(user_id: params[:user_id], status: :placed, name: params[:name], address: params[:address], phone: params[:phone], ship_fee: 10, promotion: 7.5)

      order.order_item = params[:order_item].map do |order_item|
        raw_file_name_front = "#{SecureRandom.uuid}-print-front.png"
        raw_file_name_back = "#{SecureRandom.uuid}-print-back.png"
        file_name_front = "print_images/#{raw_file_name_front}"
        file_name_back = "print_images/#{raw_file_name_back}"
        MiniMagick::Tool::Convert.new do |i|
          i.size "1000x1750"
          i.gravity "center"
          i.xc "rgba(0,0,0,0)"
          i << file_name_front
        end
         MiniMagick::Tool::Convert.new do |i|
          i.size "1000x1750"
          i.gravity "center"
          i.xc "rgba(0,0,0,0)"
          i << file_name_back
        end
        print_image_front = MiniMagick::Image.open(file_name_front)
        print_image_back = MiniMagick::Image.open(file_name_back)
        images = order_item[:images].group_by { |image| image[:pic_id]  }

        images.map do |pic_id, images|
          images.each do |image|
            design = image[:design]
            design_image = MiniMagick::Image.open("http:#{design[:img_url]}")
            design_image.combine_options  do |i|
              i.resize "#{image[:width]}x#{image[:height]}"
              i.rotate("#{image[:rotation]}")
              i.background "rgba(0,0,0,0)"
            end
            offsetx = image[:x] - design_image.width / 2
            offsety = image[:y] - design_image.height / 2
            if pic_id == 'imgFront'
              print_image_front = print_image_front.composite(design_image) do |c|
                c.compose "Over"
                c.geometry "+#{offsetx}+#{offsety}"
              end
            else
              print_image_back = print_image_back.composite(design_image) do |c|
                c.compose "Over"
                c.geometry "+#{offsetx}+#{offsety}"
              end
            end
          end
        end
        texts = order_item[:texts].group_by { |text| text[:pic_id]  }
        texts.map do |pic_id, texts|
          texts.each do |text|
            if pic_id == 'imgFront'
              print_image = print_image_front
            else
              print_image = print_image_back
            end

            font = text[:font_family]
            if text[:bold]
              font = font + "B"
            end
            if text[:italic]
              font = font + "I"
            end
            gravity = 'North'
            if text[:align] == 'left'
              gravity = 'NorthWest'
            elsif text[:align] == 'right'
              gravity = 'NorthEast'
            end

            print_image.combine_options do |c|
              c.gravity gravity
              c.encoding 'unicode'
              c.draw "text #{text[:x]},#{text[:y]} \"#{text[:text]}\""
              c.pointsize text[:font_size] * 1000 / 180
              if text[:rotation].present?
                c.distort('SRT', text[:rotation])
              end
              c.font font
              c.fill(text[:color])
            end
          end
        end

        print_image_front.write(file_name_front)
        print_image_back.write(file_name_back)

        bucket = Aliyun::OSS::Client.new(
          :endpoint => 'makeyourfashion.oss-cn-shanghai.aliyuncs.com',
          :access_key_id => 'LTAIb0HjKR9YnBiT',
          :access_key_secret => 'vhrZC7UatNbCRm1rjLLvzgge3YE2Wu',
          :cname => true
        ).get_bucket('makeyourfashion')
        bucket.put_object("print_images/#{raw_file_name_front}", file: file_name_front)
        bucket.put_object("print_images/#{raw_file_name_back}", file: file_name_back)
        File.delete(file_name_front)
        File.delete(file_name_back)

        OrderItem.new(item_id: order_item[:item_id], price: order_item[:price], print_front: "//makeyourfashion.oss-cn-shanghai.aliyuncs.com/#{file_name_front}", print_back: "//makeyourfashion.oss-cn-shanghai.aliyuncs.com/#{file_name_back}", img: order_item[:img], size: order_item[:size], qty: order_item[:qty])
      end
      order.save

      render json: order, status: :created
    rescue ActiveRecord::RecordNotFound => ex
      render json: {}, status: :not_found
    end
  end

  def index
    begin
      user = User.where(token: cookies[:user_id]).first
      render json: Order.includes(:order_item).where(user: user).order('created_at DESC')
    rescue ActiveRecord::RecordNotFound => ex
      render nothing: true, status: :not_found
    end
  end
end
