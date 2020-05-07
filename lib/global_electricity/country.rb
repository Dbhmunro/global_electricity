class Country
    attr_accessor :name, :population_electrification, :urban_electrification, :rural_electrification, :fossil_fuel_use, :hydroelectric_use, :nuclear_fuel_use, :other_renewable_use
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end
