require_relative './electricity_access.rb'
require_relative './electricity_sources.rb'
require_relative './internet_access.rb'


class Country
    extend InternetAccess::ClassMethods
    extend ElectricityAccess::ClassMethods
    extend ElectricitySources::ClassMethods

    attr_accessor :name, :population, :internet_access, :broadband_access, :population_electrification, :urban_electrification, :rural_electrification, :fossil_fuel_use, :hydroelectric_use, :nuclear_fuel_use, :other_renewable_use, :gdp_agriculture, :gdp_industry, :gdp_service
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.all_without_world
        @@all.select { |country| (country.name != "World" && country.name != "Curacao" && country.name != "Gaza Strip" && country.name != "Guernsey" && country.name != "Isle of Man" && country.name != "Jersey" && country.name != "Liechtenstein" && country.name != "Monaco" && country.name != "Northern Mariana Islands" && country.name != "Palau" && country.name != "Saint Martin" && country.name != "San Marino" && country.name != "Sint Maarten" && country.name != "Korea, North" && country.name != "South Sudan" && country.name != "American Samoa"  && country.name != "Aruba"  && country.name != "Bermuda"  && country.name != "Congo, Republic of the"  && country.name != "Guam"  && country.name != "Kosovo"  && country.name != "New Caledonia" && country.name != "Palau" && country.name != "Sierra Leone"  && country.name != "Turks and Caicos Islands"  && country.name != "Virgin Islands") }
        #exclude list built based on countries that lacked data
    end

    def self.select_country(country)
        self.all.find { |c| c.name == country}
    end

    def self.country_names
        self.all_without_world.map(&:name).map { |e| e.downcase}
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
