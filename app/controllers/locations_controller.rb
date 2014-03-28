class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all.sort_by(&:michelinrate).reverse
  end

  def show
    @location = Location.find(params[:id])

    @query = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{URI::escape(@location.name)}+in+#{URI::escape(@location.city)}&types=restaurant&sensor=true&key=AIzaSyAzxH8eKAW9zPrmvdTYkihBrhJqO0fR5tk")

    @response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?reference=#{@query['results'][0]['reference']}&sensor=true&key=AIzaSyAzxH8eKAW9zPrmvdTYkihBrhJqO0fR5tk")
  end

  def new
    @location = Location.new  
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @location = Location.find(params[:id])
    
    if @location.update location_params
      redirect_to action: 'index', notice: 'Location was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @location.destroy
    
    redirect_to locations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(
        :name
      )
    end

end
