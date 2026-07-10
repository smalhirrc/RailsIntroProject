class ParksController < ApplicationController
  def index
  end

  def about
  end

  def show
    @park = Park.find_by(park_id: params[:id])
    @asset = Asset.where(park_id: params[:id])
  end

  def search
    @query = params[:query]

    @parks = Park.where(
      "park_name LIKE :q OR park_category LIKE :q OR location_description LIKE :q",
      q: "%#{@query}%"
    )
  end
end
