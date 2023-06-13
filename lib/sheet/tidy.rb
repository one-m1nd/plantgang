require 'csv'

module Sheet
  # Tidy up CSV file
  # Removes trailing whitespaces/normalizes formatting
  class Tidy
    # @return [String]
    CACTI = File.join(Dir.home, 'Downloads', "cacti.csv")

    # @return [String]
    TROPICAL = File.join(Dir.home, 'Downloads', "tropical.csv")

    # @return [String]
    SUCCULENTS = File.join(Dir.home, 'Downloads', "succulents.csv")

    # @return [void]
    def execute
      [CACTI, TROPICAL, SUCCULENTS].each do |file|
        parsed = parse_csv(file)
        tidy_csv(parsed)
        write_csv(parsed, file)
      end
    end

    private

    # @param file [String]
    # @return [CSV::Table]
    def parse_csv(file)
      CSV.read(file, headers: true)
    end

    # @param [CSV::Table]
    def tidy_csv(csv)
      csv.each do |row|
        row["Name"] = capitalize(row["Name"]).rstrip
        row["Genus"] = capitalize(row["Genus"]).rstrip
        row["Family"] = capitalize(row["Family"]).rstrip
      end
    end

    # @param csv [CSV::Table]
    # @param file [String]
    # @return [void]
    def write_csv(csv, file)
      File.write(file, csv.to_s)
    end


    # @param string [String]
    # @return [String]
    def capitalize(string)
      string
        .split(" ")
        .map! { |str| str.capitalize }
        .join(" ")
    end

    class << self
      # @return [void]
      def execute
        Tidy.new.execute
      end
    end
  end
end