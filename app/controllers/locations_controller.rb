class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
     if(!params[:sort].nil?)
        @locations = Location.order(params[:sort] + ' ' + params[:direction]).all
     else
        @locations = Location.all
     end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
    @soil_types = Soil.all
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   
   # POST /locations
   def edit_multiple
     @locations = Location.find(params[:location_ids])
   end
   
   # Put /locations
   def update_multiple
     puts "$$$$.$$ params=#{params.inspect}"
     @locations = Location.find(params[:location_ids])
     @locations.each do |location|
       location.update_attributes!(location_params.reject { |k,v| v.blank? })
     end
     flash[:notice] = "Updated locations!"
     redirect_to locations_path
   end

  private
   
   def sort_column  
       Location.column_names.include?(params[:sort]) ? params[:sort] : "name"    
    end  
    # Use callbacks to share common setup or constraints between actions.
    def set_location
       puts "$$$$.$$ params=#{params.inspect}"
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :sub_name, :soil_id, :size, :comment)
    end
end
