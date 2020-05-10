require_relative './country.rb'

module ElectricityAccess
    module ClassMethods
        # these methods will only work in the Country class
        # variables population_electrification, urban_electrification, rural_electrification


        def electricity_access_alphabetical_sort_short
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
            puts "      Population with Access to Electricity"
            puts "                   (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban         Rural         Country ^ "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "            "
                elsif collection[n][1].length == 3
                    print "           "
                elsif collection[n][1].length == 4
                    print "          "
                elsif collection[n][1].length == 5
                    print "         "
                end
                print "#{collection[n][2]}"
                if collection[n][2].length == 2
                    print "            "
                elsif collection[n][2].length == 3
                    print "           "
                elsif collection[n][2].length == 4
                    print "          "
                elsif collection[n][2].length == 5
                    print "         "
                end
                print "#{collection[n][3]}"
                if collection[n][3].length == 2
                    print "            "
                elsif collection[n][3].length == 3
                    print "           "
                elsif collection[n][3].length == 4
                    print "          "
                elsif collection[n][3].length == 5
                    print "         "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_access_alphabetical_sort
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
            puts "      Population with Access to Electricity"
            puts "                   (Full List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban         Rural         Country ^ "
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

        def electricity_access_population_sort_short
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
            puts "      Population with Access to Electricity"
            puts "                   (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total ^       Urban         Rural         Country  "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "            "
                elsif collection[n][1].length == 3
                    print "           "
                elsif collection[n][1].length == 4
                    print "          "
                elsif collection[n][1].length == 5
                    print "         "
                end
                print "#{collection[n][2]}"
                if collection[n][2].length == 2
                    print "            "
                elsif collection[n][2].length == 3
                    print "           "
                elsif collection[n][2].length == 4
                    print "          "
                elsif collection[n][2].length == 5
                    print "         "
                end
                print "#{collection[n][3]}"
                if collection[n][3].length == 2
                    print "            "
                elsif collection[n][3].length == 3
                    print "           "
                elsif collection[n][3].length == 4
                    print "          "
                elsif collection[n][3].length == 5
                    print "         "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_access_population_sort
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
            puts "      Population with Access to Electricity"
            puts "                   (Full List)"
            puts "------------------------------------------------------------"
            puts " Total ^       Urban         Rural         Country  "
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

        def electricity_access_urban_sort_short
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
            puts "      Population with Access to Electricity"
            puts "                   (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban ^       Rural         Country  "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "            "
                elsif collection[n][1].length == 3
                    print "           "
                elsif collection[n][1].length == 4
                    print "          "
                elsif collection[n][1].length == 5
                    print "         "
                end
                print "#{collection[n][2]}"
                if collection[n][2].length == 2
                    print "            "
                elsif collection[n][2].length == 3
                    print "           "
                elsif collection[n][2].length == 4
                    print "          "
                elsif collection[n][2].length == 5
                    print "         "
                end
                print "#{collection[n][3]}"
                if collection[n][3].length == 2
                    print "            "
                elsif collection[n][3].length == 3
                    print "           "
                elsif collection[n][3].length == 4
                    print "          "
                elsif collection[n][3].length == 5
                    print "         "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_access_urban_sort
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
            puts "      Population with Access to Electricity"
            puts "                   (Full List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban ^       Rural         Country  "
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

        def electricity_access_rural_sort_short
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
            puts "      Population with Access to Electricity"
            puts "                   (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban         Rural ^       Country  "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "            "
                elsif collection[n][1].length == 3
                    print "           "
                elsif collection[n][1].length == 4
                    print "          "
                elsif collection[n][1].length == 5
                    print "         "
                end
                print "#{collection[n][2]}"
                if collection[n][2].length == 2
                    print "            "
                elsif collection[n][2].length == 3
                    print "           "
                elsif collection[n][2].length == 4
                    print "          "
                elsif collection[n][2].length == 5
                    print "         "
                end
                print "#{collection[n][3]}"
                if collection[n][3].length == 2
                    print "            "
                elsif collection[n][3].length == 3
                    print "           "
                elsif collection[n][3].length == 4
                    print "          "
                elsif collection[n][3].length == 5
                    print "         "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_access_rural_sort
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
            puts "      Population with Access to Electricity"
            puts "                   (Full List)"
            puts "------------------------------------------------------------"
            puts " Total         Urban         Rural ^       Country  "
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