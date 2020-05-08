require_relative './electricity_access.rb'
require_relative './fossil_fuel.rb'
require_relative './hydroelectric.rb'
require_relative './nuclear_fuel.rb'
require_relative './other_renewable.rb'

class Country
    extend ElectricityAccess::ClassMethods
    extend FossilFuel::ClassMethods
    extend NuclearFuel::ClassMethods
    extend Hydroelectric::ClassMethods
    extend OtherRenewable::ClassMethods

    attr_accessor :name, :population_electrification, :urban_electrification, :rural_electrification, :fossil_fuel_use, :hydroelectric_use, :nuclear_fuel_use, :other_renewable_use
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.all_without_world
        @@all.select { |country| country.name != "World" }
    end

    def self.select_country(country)
        self.all.find { |c| c.name == country}
    end

    def self.country_names
        self.all.map(&:name).map { |e| e.downcase}
        # binding.pry
    end

    def self.present_country_list
        # self.all.map(&:name).each_with_index do |country_name, index|
        #     if country_name != "World"
        #         puts "#{index + 1}. - #{country_name}"
        #     end
        # end
        self.all_without_world.map(&:name).each_with_index do |country_name, index|
            puts "#{index + 1}. - #{country_name}"
        end
    end


    
end
