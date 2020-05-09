require_relative './country.rb'

module ElectricitySources
    module ClassMethods
        # these methods will only work in the Country class

        def sources_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel
                row << country.nuclear_fuel
                row << country.hydroelectric
                row << country.other_renewable
                collection << row
            end
            puts ""
            puts ""
            puts "                      Sources of electricity generation"
            puts " Fossil Fuel       Nuclear       Hydroelectric       Other Renewables       Country "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "            "
                elsif row[1].length == 3
                    print "           "
                elsif row[1].length == 4
                    print "          "
                elsif row[1].length == 5
                    print "         "
                end
                print "#{row[2]}"
                if row[2].length == 2
                    print "            "
                elsif row[2].length == 3
                    print "           "
                elsif row[2].length == 4
                    print "          "
                elsif row[2].length == 5
                    print "         "
                end
                print "#{row[3]}"
                if row[3].length == 2
                    print "            "
                elsif row[3].length == 3
                    print "           "
                elsif row[3].length == 4
                    print "          "
                elsif row[3].length == 5
                    print "         "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "            "
                elsif row[4].length == 3
                    print "           "
                elsif row[4].length == 4
                    print "          "
                elsif row[4].length == 5
                    print "         "
                end
                    puts "#{row[0]}"
            end
        end

        def sources_population_sort
            collection = []
            self.all_without_world.sort_by { |country| country.population_electrification.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel
                row << country.nuclear_fuel
                row << country.hydroelectric
                row << country.other_renewable
                collection << row
            end
            puts ""
            puts ""
            puts "                      Sources of electricity generation"
            puts " Fossil Fuel       Nuclear       Hydroelectric       Other Renewables       Country "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "            "
                elsif row[1].length == 3
                    print "           "
                elsif row[1].length == 4
                    print "          "
                elsif row[1].length == 5
                    print "         "
                end
                print "#{row[2]}"
                if row[2].length == 2
                    print "            "
                elsif row[2].length == 3
                    print "           "
                elsif row[2].length == 4
                    print "          "
                elsif row[2].length == 5
                    print "         "
                end
                print "#{row[3]}"
                if row[3].length == 2
                    print "            "
                elsif row[3].length == 3
                    print "           "
                elsif row[3].length == 4
                    print "          "
                elsif row[3].length == 5
                    print "         "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "            "
                elsif row[4].length == 3
                    print "           "
                elsif row[4].length == 4
                    print "          "
                elsif row[4].length == 5
                    print "         "
                end
                    puts "#{row[0]}"
            end
        end

        def sources_urban_sort
            collection = []
            self.all_without_world.sort_by { |country| country.urban_electrification.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel
                row << country.nuclear_fuel
                row << country.hydroelectric
                row << country.other_renewable
                collection << row
            end
            puts ""
            puts ""
            puts "                      Sources of electricity generation"
            puts " Fossil Fuel       Nuclear       Hydroelectric       Other Renewables       Country "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "            "
                elsif row[1].length == 3
                    print "           "
                elsif row[1].length == 4
                    print "          "
                elsif row[1].length == 5
                    print "         "
                end
                print "#{row[2]}"
                if row[2].length == 2
                    print "            "
                elsif row[2].length == 3
                    print "           "
                elsif row[2].length == 4
                    print "          "
                elsif row[2].length == 5
                    print "         "
                end
                print "#{row[3]}"
                if row[3].length == 2
                    print "            "
                elsif row[3].length == 3
                    print "           "
                elsif row[3].length == 4
                    print "          "
                elsif row[3].length == 5
                    print "         "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "            "
                elsif row[4].length == 3
                    print "           "
                elsif row[4].length == 4
                    print "          "
                elsif row[4].length == 5
                    print "         "
                end
                    puts "#{row[0]}"
            end
        end

        def sources_rural_sort
            collection = []
            self.all_without_world.sort_by { |country| country.rural_electrification.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel
                row << country.nuclear_fuel
                row << country.hydroelectric
                row << country.other_renewable
                collection << row
            end
            puts ""
            puts ""
            puts "                      Sources of electricity generation"
            puts " Fossil Fuel       Nuclear       Hydroelectric       Other Renewables       Country "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "            "
                elsif row[1].length == 3
                    print "           "
                elsif row[1].length == 4
                    print "          "
                elsif row[1].length == 5
                    print "         "
                end
                print "#{row[2]}"
                if row[2].length == 2
                    print "            "
                elsif row[2].length == 3
                    print "           "
                elsif row[2].length == 4
                    print "          "
                elsif row[2].length == 5
                    print "         "
                end
                print "#{row[3]}"
                if row[3].length == 2
                    print "            "
                elsif row[3].length == 3
                    print "           "
                elsif row[3].length == 4
                    print "          "
                elsif row[3].length == 5
                    print "         "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "            "
                elsif row[4].length == 3
                    print "           "
                elsif row[4].length == 4
                    print "          "
                elsif row[4].length == 5
                    print "         "
                end
                    puts "#{row[0]}"
            end
        end
    end
end