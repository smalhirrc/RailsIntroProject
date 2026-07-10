class ParksController < ApplicationController
  def index
  end

  def about
  end

  def show
    @park = Park.find_by(park_id: params[:id])
    @asset = Asset.where(park_id: params[:id])
  end
end
