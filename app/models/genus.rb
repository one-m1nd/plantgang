class Genus < ApplicationRecord
  has_many :plants
  has_many :families, through: :plants
end
