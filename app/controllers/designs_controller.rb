require 'aliyun/oss'

class DesignsController < ApplicationController
  def index
    if params[:tag].present?
      render json: {
        designs: Design.includes(:tags).where({"tags.id" => params[:tag], is_private: false})
      }
    else
      render json: {
        designs: Design.where({is_private: false}).limit(100),
        tags: Tag.limit(100)
      }
    end
  end

  def create
    bucket = Aliyun::OSS::Client.new(
      :endpoint => 'makeyourfashion.oss-cn-shanghai.aliyuncs.com',
      :access_key_id => 'LTAIb0HjKR9YnBiT',
      :access_key_secret => 'vhrZC7UatNbCRm1rjLLvzgge3YE2Wu',
      :cname => true
    ).get_bucket('makeyourfashion')
    name = "#{SecureRandom.uuid}-#{params[:image].original_filename}"
    bucket.put_object(name, file: params[:image].tempfile)

    design = Design.new(img_url: "//makeyourfashion.oss-cn-shanghai.aliyuncs.com/#{name}")
    if params[:tag].empty?
      design.is_private = true
    else
      design.tags << Tag.find(params[:tag])
    end

    design.save
    render json: design
  end
end
