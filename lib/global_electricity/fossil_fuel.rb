require_relative './country.rb'

module FossilFuel
    module ClassMethods
        def fossil_fuel_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.population_electrification
                row << country.urban_electrification
                row << country.rural_electrification
                collection << row
            end
            puts ""
            puts ""
            puts "      Population with access to electricity"
            puts " Total         Urban         Rural         Country "
            puts "------------------------------------------------------------"
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
                    puts "#{row[0]}"
            end
        end
    end
end