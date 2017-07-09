class DesignsController < ApplicationController
  def index
    if params[:tag].present?
      render json: {
        designs: Design.includes(:tags).where("tags.id" => params[:tag])
      }
    else
      render json: {
        designs: Design.limit(100),
        tags: Tag.limit(100)
      }
    end
  end

  def create
    # bucket = Aliyun::OSS::Client.new(
    #   :endpoint => 'oss-cn-shanghai.aliyuncs.com',
    #   :access_key_id => 'LTAIb0HjKR9YnBiT',
    #   :access_key_secret => 'vhrZC7UatNbCRm1rjLLvzgge3YE2Wu',
    #   :cname => true).get_bucket('makeyourfashion'
    # )
    # name = "#{SecureRandom.uuid}-#{params[:file].name}"
    # object = bucket.put_object(name, file: params[:file])
    # render json: Design.create(img_url: "//makeyourfashion.oss-cn-shanghai.aliyuncs.com/#{object.key}", tag: params[:tag])
    design = Design.new(img_url: params[:img_url])
    design.tags << Tag.find(params[:tag])
    design.save
    render json: design
  end
end
