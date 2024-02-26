class SunlightHoursController < ApplicationController
  def index
    @sunlight_hours = Rails.cache.fetch(:sunlight_hours_value, expires_in: 15.minutes) do
      ShowSunlightHours.show
    end
  end
end