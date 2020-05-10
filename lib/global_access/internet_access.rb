module InternetAccess
    module ClassMethods
        # these methods will only work in the Country class
        # variables internet_access, broadband_access


        def internet_access_alphabetical_sort_short
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "             (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total         Broadband          Country ^ "
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
                    print "                 "
                elsif collection[n][2].length == 3
                    print "                "
                elsif collection[n][2].length == 4
                    print "               "
                elsif collection[n][2].length == 5
                    print "              "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_access_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "              (Full List)"
            puts "------------------------------------------------------------"
            puts " Total         Broadband          Country ^ "
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
                    print "                 "
                elsif row[2].length == 3
                    print "                "
                elsif row[2].length == 4
                    print "               "
                elsif row[2].length == 5
                    print "              "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_access_population_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.internet_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "             (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total ^       Broadband          Country  "
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
                    print "                 "
                elsif collection[n][2].length == 3
                    print "                "
                elsif collection[n][2].length == 4
                    print "               "
                elsif collection[n][2].length == 5
                    print "              "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_access_population_sort
            collection = []
            self.all_without_world.sort_by { |country| country.internet_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "              (Full List)"
            puts "------------------------------------------------------------"
            puts " Total ^       Broadband          Country  "
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
                    print "                 "
                elsif row[2].length == 3
                    print "                "
                elsif row[2].length == 4
                    print "               "
                elsif row[2].length == 5
                    print "              "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_access_broadband_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.broadband_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "             (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Total         Broadband ^        Country  "
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
                    print "                 "
                elsif collection[n][2].length == 3
                    print "                "
                elsif collection[n][2].length == 4
                    print "               "
                elsif collection[n][2].length == 5
                    print "              "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_access_broadband_sort
            collection = []
            self.all_without_world.sort_by { |country| country.broadband_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.broadband_access
                collection << row
            end
            puts ""
            puts ""
            puts "    Population with Access to Internet"
            puts "              (Full List)"
            puts "------------------------------------------------------------"
            puts " Total         Broadband ^        Country  "
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
                    print "                 "
                elsif row[2].length == 3
                    print "                "
                elsif row[2].length == 4
                    print "               "
                elsif row[2].length == 5
                    print "              "
                end
                    puts "#{row[0]}"
            end
        end


    end
end