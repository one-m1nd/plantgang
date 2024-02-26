class SunlightHoursController < ApplicationController
  def index
    @sunlight_hours = ShowSunlightHours.show
  end
end