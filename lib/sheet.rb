require 'sheet/import'
require 'sheet/tidy'

module Sheet
  class << self
    # @return [void]
    def import
      Import.execute
    end

    # @return [void]
    def tidy
      Tidy.execute
    end
  end
end