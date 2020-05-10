require_relative './country.rb'

module ElectricitySources
    module ClassMethods
        # these methods will only work in the Country class

        def electricity_sources_alphabetical_sort_short
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Top 20 List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric     Other Renewables     Country ^ "
            puts "-------------------------------------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "              "
                elsif collection[n][1].length == 3
                    print "             "
                elsif collection[n][1].length == 4
                    print "            "
                elsif collection[n][1].length == 5
                    print "           "
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
                    print "                "
                elsif collection[n][3].length == 3
                    print "               "
                elsif collection[n][3].length == 4
                    print "              "
                elsif collection[n][3].length == 5
                    print "             "
                end
                print "#{collection[n][4]}"
                if collection[n][4].length == 2
                    print "                   "
                elsif collection[n][4].length == 3
                    print "                  "
                elsif collection[n][4].length == 4
                    print "                 "
                elsif collection[n][4].length == 5
                    print "                "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_sources_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Full List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric     Other Renewables     Country ^ "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "              "
                elsif row[1].length == 3
                    print "             "
                elsif row[1].length == 4
                    print "            "
                elsif row[1].length == 5
                    print "           "
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
                    print "                "
                elsif row[3].length == 3
                    print "               "
                elsif row[3].length == 4
                    print "              "
                elsif row[3].length == 5
                    print "             "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "                   "
                elsif row[4].length == 3
                    print "                  "
                elsif row[4].length == 4
                    print "                 "
                elsif row[4].length == 5
                    print "                "
                end
                    puts "#{row[0]}"
            end
        end

        def electricity_sources_fossil_fuel_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.fossil_fuel_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Top 20 List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel ^   Nuclear       Hydroelectric     Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "              "
                elsif collection[n][1].length == 3
                    print "             "
                elsif collection[n][1].length == 4
                    print "            "
                elsif collection[n][1].length == 5
                    print "           "
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
                    print "                "
                elsif collection[n][3].length == 3
                    print "               "
                elsif collection[n][3].length == 4
                    print "              "
                elsif collection[n][3].length == 5
                    print "             "
                end
                print "#{collection[n][4]}"
                if collection[n][4].length == 2
                    print "                   "
                elsif collection[n][4].length == 3
                    print "                  "
                elsif collection[n][4].length == 4
                    print "                 "
                elsif collection[n][4].length == 5
                    print "                "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_sources_fossil_fuel_sort
            collection = []
            self.all_without_world.sort_by { |country| country.fossil_fuel_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Full List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel ^   Nuclear       Hydroelectric     Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "              "
                elsif row[1].length == 3
                    print "             "
                elsif row[1].length == 4
                    print "            "
                elsif row[1].length == 5
                    print "           "
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
                    print "                "
                elsif row[3].length == 3
                    print "               "
                elsif row[3].length == 4
                    print "              "
                elsif row[3].length == 5
                    print "             "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "                   "
                elsif row[4].length == 3
                    print "                  "
                elsif row[4].length == 4
                    print "                 "
                elsif row[4].length == 5
                    print "                "
                end
                    puts "#{row[0]}"
            end
        end

        def electricity_sources_nuclear_fuel_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.nuclear_fuel_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Top 20 List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear ^     Hydroelectric     Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "              "
                elsif collection[n][1].length == 3
                    print "             "
                elsif collection[n][1].length == 4
                    print "            "
                elsif collection[n][1].length == 5
                    print "           "
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
                    print "                "
                elsif collection[n][3].length == 3
                    print "               "
                elsif collection[n][3].length == 4
                    print "              "
                elsif collection[n][3].length == 5
                    print "             "
                end
                print "#{collection[n][4]}"
                if collection[n][4].length == 2
                    print "                   "
                elsif collection[n][4].length == 3
                    print "                  "
                elsif collection[n][4].length == 4
                    print "                 "
                elsif collection[n][4].length == 5
                    print "                "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_sources_nuclear_fuel_sort
            collection = []
            self.all_without_world.sort_by { |country| country.nuclear_fuel_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Full List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear ^     Hydroelectric     Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "              "
                elsif row[1].length == 3
                    print "             "
                elsif row[1].length == 4
                    print "            "
                elsif row[1].length == 5
                    print "           "
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
                    print "                "
                elsif row[3].length == 3
                    print "               "
                elsif row[3].length == 4
                    print "              "
                elsif row[3].length == 5
                    print "             "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "                   "
                elsif row[4].length == 3
                    print "                  "
                elsif row[4].length == 4
                    print "                 "
                elsif row[4].length == 5
                    print "                "
                end
                    puts "#{row[0]}"
            end
        end

        def electricity_sources_hydroelectric_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.hydroelectric_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Top 20 List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric ^   Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "              "
                elsif collection[n][1].length == 3
                    print "             "
                elsif collection[n][1].length == 4
                    print "            "
                elsif collection[n][1].length == 5
                    print "           "
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
                    print "                "
                elsif collection[n][3].length == 3
                    print "               "
                elsif collection[n][3].length == 4
                    print "              "
                elsif collection[n][3].length == 5
                    print "             "
                end
                print "#{collection[n][4]}"
                if collection[n][4].length == 2
                    print "                   "
                elsif collection[n][4].length == 3
                    print "                  "
                elsif collection[n][4].length == 4
                    print "                 "
                elsif collection[n][4].length == 5
                    print "                "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_sources_hydroelectric_sort
            collection = []
            self.all_without_world.sort_by { |country| country.hydroelectric_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Full List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric ^   Other Renewables     Country  "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "              "
                elsif row[1].length == 3
                    print "             "
                elsif row[1].length == 4
                    print "            "
                elsif row[1].length == 5
                    print "           "
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
                    print "                "
                elsif row[3].length == 3
                    print "               "
                elsif row[3].length == 4
                    print "              "
                elsif row[3].length == 5
                    print "             "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "                   "
                elsif row[4].length == 3
                    print "                  "
                elsif row[4].length == 4
                    print "                 "
                elsif row[4].length == 5
                    print "                "
                end
                    puts "#{row[0]}"
            end
        end

        def electricity_sources_other_renewable_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.other_renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Top 20 List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric     Other Renewables ^   Country  "
            puts "-------------------------------------------------------------------------------------------"
            (1..20).each do |n|
                print " #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "              "
                elsif collection[n][1].length == 3
                    print "             "
                elsif collection[n][1].length == 4
                    print "            "
                elsif collection[n][1].length == 5
                    print "           "
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
                    print "                "
                elsif collection[n][3].length == 3
                    print "               "
                elsif collection[n][3].length == 4
                    print "              "
                elsif collection[n][3].length == 5
                    print "             "
                end
                print "#{collection[n][4]}"
                if collection[n][4].length == 2
                    print "                   "
                elsif collection[n][4].length == 3
                    print "                  "
                elsif collection[n][4].length == 4
                    print "                 "
                elsif collection[n][4].length == 5
                    print "                "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def electricity_sources_other_renewable_sort
            collection = []
            self.all_without_world.sort_by { |country| country.other_renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.fossil_fuel_use
                row << country.nuclear_fuel_use
                row << country.hydroelectric_use
                row << country.other_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "                     Sources of Electricity Generation"
            puts "                               (Full List)"
            puts "-------------------------------------------------------------------------------------------"
            puts " Fossil Fuel     Nuclear       Hydroelectric     Other Renewables ^   Country  "
            puts "-------------------------------------------------------------------------------------------"
            collection.each do |row|
                print " #{row[1]}"
                if row[1].length == 2
                    print "              "
                elsif row[1].length == 3
                    print "             "
                elsif row[1].length == 4
                    print "            "
                elsif row[1].length == 5
                    print "           "
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
                    print "                "
                elsif row[3].length == 3
                    print "               "
                elsif row[3].length == 4
                    print "              "
                elsif row[3].length == 5
                    print "             "
                end
                print "#{row[4]}"
                if row[4].length == 2
                    print "                   "
                elsif row[4].length == 3
                    print "                  "
                elsif row[4].length == 4
                    print "                 "
                elsif row[4].length == 5
                    print "                "
                end
                    puts "#{row[0]}"
            end
        end


    end
end