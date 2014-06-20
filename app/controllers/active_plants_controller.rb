class ActivePlantsController < ApplicationController
  before_action :set_active_plant, only: [:show, :edit, :update, :destroy]

  # GET /active_plants
  # GET /active_plants.json
  def index
    @active_plants = ActivePlant.all
  end

  # GET /active_plants/1
  # GET /active_plants/1.json
  def show
  end

  # GET /active_plants/new
  def new
    @active_plant = ActivePlant.new
    @plants = Plant.all
    @plant_status = PlantStatus.all
    @locations = Location.all


  end

  # GET /active_plants/1/edit
  def edit
  end

  # POST /active_plants
  # POST /active_plants.json
  def create
    @active_plant = ActivePlant.new(active_plant_params)

    respond_to do |format|
      if @active_plant.save
        format.html { redirect_to @active_plant, notice: 'Active plant was successfully created.' }
        format.json { render :show, status: :created, location: @active_plant }
      else
        format.html { render :new }
        format.json { render json: @active_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_plants/1
  # PATCH/PUT /active_plants/1.json
  def update
    respond_to do |format|
      if @active_plant.update(active_plant_params)
        format.html { redirect_to @active_plant, notice: 'Active plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @active_plant }
      else
        format.html { render :edit }
        format.json { render json: @active_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_plants/1
  # DELETE /active_plants/1.json
  def destroy
    @active_plant.destroy
    respond_to do |format|
      format.html { redirect_to active_plants_url, notice: 'Active plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_plant
      @active_plant = ActivePlant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def active_plant_params
      params.require(:active_plant).permit(:plant_id, :status_id, :location_id, :soil_id, :count_active, :count_harvested, :comment)
    end
end
