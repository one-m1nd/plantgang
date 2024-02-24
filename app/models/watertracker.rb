class Watertracker < ApplicationRecord
  class << self
    # @param days [Integer] how many days buffer, defaults to 21(3 weeks)
    # @return [Date] next date to water plants
    def next_date(days = 21)
      Watertracker.last.date + days.days
    end

    # Creates water tracker object for today, i.e we watered the plants today
    # @return [void]
    def for_today
      Watertracker.create(date: Date.today)
    end
  end
end
