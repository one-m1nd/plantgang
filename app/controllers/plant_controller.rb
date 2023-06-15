class PlantController < ApplicationController
  def index
    @plants = Plant.all.includes(:genus, :family).sort_by(&:name)
  end
end
