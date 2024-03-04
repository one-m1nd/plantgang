class Plant < ApplicationRecord
  DEAD = 2
  ALIVE = 1

  belongs_to :family
  belongs_to :genus
  belongs_to :status

  # @return [Hash]
  def trefle_data
    Rails.cache.fetch("#{name}-trefle", expires_in: 15.minutes) do
      response = Plants.search_for_plant(name)
      if response.status.success?
        response.parse['data'].first
      else
        {}
      end
    end
  end

  class << self
    def dead
      Plant.where(status_id: DEAD)
    end

    def alive
      Plant.where(status_id: ALIVE)
    end
  end
end
