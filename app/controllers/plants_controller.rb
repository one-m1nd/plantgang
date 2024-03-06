class PlantsController < ApplicationController
  before_action :set_plant, only: %i[ show edit update destroy]

  # GET /plants or /plants.json
  def index
    @plants = Plant.all.includes(:genus, :family, :status).sort_by(&:name)

    case
    when params[:genus].present?
      @plants.select! { |plant| plant.genus.name == params[:genus] }
    when params[:family].present?
      @plants.select! { |plant| plant.family.name == params[:family] }
    when params[:status].present?
      @plants.select! { |plant| plant.status.name == params[:status] }
    when params[:year_acquired].present?
      @plants.select! { |plant| plant.year_acquired == params[:year_acquired] }
    end
  end

  # GET /plants/1 or /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants or /plants.json
  def create
    @plant = Plant.new(plant_params)
    @plant.name = @plant.name.split(" ").map(&:capitalize).join(" ")

    respond_to do |format|
      if @plant.save
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully created." }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1 or /plants/1.json
  def update
    @plant.name = @plant.name.split(" ").map(&:capitalize).join(" ")

    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully updated." }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1 or /plants/1.json
  def destroy
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url, notice: "Plant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find_by(name: params[:id])
      @plant ||= Plant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plant_params
      params.require(:plant).permit([:name, :family_id, :genus_id, :status_id, :year_acquired, :common_name])
    end
end
