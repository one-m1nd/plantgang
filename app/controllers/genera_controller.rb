class GeneraController < ApplicationController
  before_action :set_genus, only: %i[ show edit update destroy ]

  # GET /genera or /genera.json
  def index
    @genera = Genus.all.includes(:plants, :families)
  end

  # GET /genera/1 or /genera/1.json
  def show
  end

  # GET /genera/new
  def new
    @genus = Genus.new
  end

  # GET /genera/1/edit
  def edit
  end

  # POST /genera or /genera.json
  def create
    @genus = Genus.new(genus_params)
    @genus.name = @genus.name.capitalize

    respond_to do |format|
      if @genus.save
        format.html { redirect_to genus_url(@genus), notice: "Genus was successfully created." }
        format.json { render :show, status: :created, location: @genus }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @genus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genera/1 or /genera/1.json
  def update
    respond_to do |format|
      if @genus.update(genus_params)
        format.html { redirect_to genus_url(@genus), notice: "Genus was successfully updated." }
        format.json { render :show, status: :ok, location: @genus }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @genus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genera/1 or /genera/1.json
  def destroy
    @genus.destroy

    respond_to do |format|
      format.html { redirect_to genera_url, notice: "Genus was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genus
      @genus = Genus.find_by(name: params[:id])
      @genus ||= Genus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genus_params
      params.require(:genus).permit([:name])
    end
end
