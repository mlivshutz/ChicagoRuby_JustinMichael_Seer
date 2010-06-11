require 'rubygems'
require 'fastercsv'

class Crime
  def self.all
    @@headers = nil
    crimes = []
    FasterCSV.foreach('../../../db/crime_data/crimes.csv') do |row|
      if (!@@headers)
        @@headers = row.map(&:to_sym)
      else
        crimes << new(row)
      end
    end
    crimes
  end

  def initialize(row)
    @data = Hash[*@@headers.zip(row).flatten]
  end

  def method_missing(key)
    @data[key]
  end

  attr_reader :data
end

# crimes = Crime.all
# p crimes.first.latitude

