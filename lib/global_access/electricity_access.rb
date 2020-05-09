require_relative './country.rb'

module ElectricityAccess
    module ClassMethods
        # these methods will only work in the Country class

        # def self.access_electricity
        #     self.all_without_world.collect do |country|
        #     end
        # end

        def access_alphabetical_sort
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
            collection.each do |row| #nice to have, add a new column header after so many rows (standard screen height)
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

        def access_population_sort #nice to have, sub-sort matching values by ascending alphabetical country name order
            collection = []
            self.all_without_world.sort_by { |country| country.population_electrification.to_f }.reverse.collect do |country|
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

        def access_urban_sort
            collection = []
            self.all_without_world.sort_by { |country| country.urban_electrification.to_f }.reverse.collect do |country|
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

        def access_rural_sort
            collection = []
            self.all_without_world.sort_by { |country| country.rural_electrification.to_f }.reverse.collect do |country|
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

        # def access_print #should only be called on methods that create collections
        #     self.access_alphabetical_sort.each do |row|
        #         puts "#{row}"
        #     end
        # end
    end
end