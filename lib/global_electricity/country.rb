class Country
    # extend ElectricityAccess::ClassMethods
    # include ElectricityAccess::InstanceMethods

    attr_accessor :name, :population_electrification, :urban_electrification, :rural_electrification, :fossil_fuel_use, :hydroelectric_use, :nuclear_fuel_use, :other_renewable_use
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.select_country(country)
        self.all.find { |c| c.name == country}
    end

    def self.country_names
        self.all.map(&:name).map { |e| e.downcase}
        # binding.pry
    end

    def self.present_country_list
        self.all.map(&:name).each_with_index do |country, index|
            puts "#{index + 1}. - #{country}"
        end
    end
end
