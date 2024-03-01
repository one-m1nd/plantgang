class Family < ApplicationRecord
  has_many :plants
  has_many :genera, through: :plants

  def trefle_data
    Rails.cache.fetch("#{name}-trefle", expires_in: 15.minutes) do
      response = Plants.find_family(name.downcase)
      if response.status.success?
        response.parse['data']
      else
        {}
      end
    end
  end
end
