require('mini_magick')

class ImageController < ApplicationController
  def create
    if params[:type] == 'nobackground'
      image = params[:image]
      temp_path = Rails.root.join('public', 'uploads', image.original_filename)
      File.open(temp_path, 'wb') do |file|
        file.write(image.read)
      end

      MiniMagick::Tool::Convert.new do |convert|
        convert << temp_path
        convert << '-fuzz' << '20%'
        convert << '-transparent' << 'white'
        convert << "#{temp_path}.png"
      end
      dataurl = "data:image/png;base64,#{Base64.encode64(open("#{temp_path}.png") { |io| io.read })}"
      render json: {
        file: dataurl
      }
      # image = MiniMagick::Image.read(params[:image].read)
      # image.convert('-fuzz 20% -transparent white')
    else
      render json: {}
    end
  end
end
