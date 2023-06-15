require 'csv'

module Sheet
  class Import
    # @return [String]
    CACTI = File.join(Dir.home, 'Downloads', "cacti.csv")

    # @return [String]
    TROPICAL = File.join(Dir.home, 'Downloads', "tropical.csv")

    # @return [String]
    SUCCULENTS = File.join(Dir.home, 'Downloads', "succulents.csv")


    # @return [void]
    def execute
      [CACTI, TROPICAL, SUCCULENTS].each do |sheet|
        rows = CSV.read(sheet, headers: true)
        rows.each do |row|
          genus = Genus.find_or_create_by!(name: row["Genus"])
          family = Family.find_or_create_by!(name: row["Family"])
          Plant.find_or_create_by!(name: row["Name"], genus: genus, family: family)
        end

        Rails.logger.info("imported #{rows.length} plant(s) from #{sheet}")
      end
    end

    class << self
      # @return [void]
      def execute
        new.execute
      end
    end
  end
end