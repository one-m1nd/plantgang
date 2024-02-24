class WatertrackersController < ApplicationController
  before_action :set_watertracker, only: %i[ show edit update destroy]

  # GET /watertracker or /watertracker.json
  def index
    @trackers = Watertracker.all.sort_by(&:date)
  end

  # GET /watertracker/1 or /watertracker/1.json
  def show
  end

  # GET /watertracker/new
  def new
    @tracker = Watertracker.new
  end

  # GET /watertracker/1/edit
  def edit
  end

  # POST /watertracker or /watertracker.json
  def create
    @tracker = Watertracker.new(tracker_params)

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to watertracker_url(@tracker), notice: "Tracker was successfully created." }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watertracker/1 or /watertracker/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to watertracker_url(@tracker), notice: "Tracker was successfully updated." }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watertracker/1 or /watertracker/1.json
  def destroy
    @tracker.destroy

    respond_to do |format|
      format.html { redirect_to watertracker_url, notice: "Tracker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_watertracker
    @tracker = Watertracker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tracker_params
    params.require(:watertracker).permit([:date])
  end
end