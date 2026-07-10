class DistrictsController < ApplicationController
  def districts
    @districts = District.order(:district_name)
  end

  def showdistrict
    @district = District.find(params[:id])
  end
end
