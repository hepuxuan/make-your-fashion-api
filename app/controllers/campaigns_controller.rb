class CampaignsController < ApplicationController
  def index
    render json: {
      campaigns: Campaign.limit(100)
    }
  end
end
