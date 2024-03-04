class Status < ApplicationRecord
  has_many :plants

  DEAD = 'Dead'.freeze

  ALIVE = 'Alive'.freeze

  class << self
    # @return [Status]
    def dead
      find_by(name: DEAD)
    end

    # @return [Status]
    def alive
      find_by(name: ALIVE)
    end
  end
end
