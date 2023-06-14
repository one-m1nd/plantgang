class Plant < ApplicationRecord
  belongs_to :family
  belongs_to :genus
end
