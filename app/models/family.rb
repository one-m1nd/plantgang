class Family < ApplicationRecord
  has_many :plants
  has_many :genera, through: :plants
end
