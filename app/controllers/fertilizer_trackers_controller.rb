class FertilizerTrackersController < ApplicationController
  before_action :set_fertilizer_tracker, only: %i[ show edit update destroy ]

  # GET /fertilizer_trackers or /fertilizer_trackers.json
  def index
    @fertilizer_trackers = FertilizerTracker.all
  end

  # GET /fertilizer_trackers/1 or /fertilizer_trackers/1.json
  def show
  end

  # GET /fertilizer_trackers/new
  def new
    @fertilizer_tracker = FertilizerTracker.new
  end

  # GET /fertilizer_trackers/1/edit
  def edit
  end

  # POST /fertilizer_trackers or /fertilizer_trackers.json
  def create
    @fertilizer_tracker = FertilizerTracker.new(fertilizer_tracker_params)

    respond_to do |format|
      if @fertilizer_tracker.save
        format.html { redirect_to fertilizer_tracker_url(@fertilizer_tracker), notice: "Fertilizer tracker was successfully created." }
        format.json { render :show, status: :created, location: @fertilizer_tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fertilizer_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fertilizer_trackers/1 or /fertilizer_trackers/1.json
  def update
    respond_to do |format|
      if @fertilizer_tracker.update(fertilizer_tracker_params)
        format.html { redirect_to fertilizer_tracker_url(@fertilizer_tracker), notice: "Fertilizer tracker was successfully updated." }
        format.json { render :show, status: :ok, location: @fertilizer_tracker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fertilizer_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fertilizer_trackers/1 or /fertilizer_trackers/1.json
  def destroy
    @fertilizer_tracker.destroy

    respond_to do |format|
      format.html { redirect_to fertilizer_trackers_url, notice: "Fertilizer tracker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fertilizer_tracker
      @fertilizer_tracker = FertilizerTracker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fertilizer_tracker_params
      params.require(:fertilizer_tracker).permit([:name, :date])
    end
end
