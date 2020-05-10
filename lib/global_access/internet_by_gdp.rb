module InternetByGDP
    module ClassMethods
        # these methods will only work in the Country class
        # variables internet_based_gdp_agriculture, internet_based_gdp_industry, internet_based_gdp_service

        
        def internet_by_gdp_alphabetical_sort_short
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry      Service         Country ^ "
            puts "   Access         Access       Access      "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif collection[n][3].length == 3
                    print "             "
                elsif collection[n][3].length == 4
                    print "            "
                elsif collection[n][3].length == 5
                    print "           "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_by_gdp_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry      Service         Country ^ "
            puts "   Access         Access       Access      "
            puts "------------------------------------------------------------"
            collection.each do |row| #nice to have, add a new column header after so many rows (standard screen height)
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
                    print "              "
                elsif row[3].length == 3
                    print "             "
                elsif row[3].length == 4
                    print "            "
                elsif row[3].length == 5
                    print "           "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_by_gdp_agriculture_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_agriculture.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Agriculture ^   Industry      Service         Country  "
            puts "   Access         Access       Access     "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif collection[n][3].length == 3
                    print "             "
                elsif collection[n][3].length == 4
                    print "            "
                elsif collection[n][3].length == 5
                    print "           "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_by_gdp_agriculture_sort
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_agriculture.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Agriculture ^   Industry      Service         Country  "
            puts "   Access         Access       Access     "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif row[3].length == 3
                    print "             "
                elsif row[3].length == 4
                    print "            "
                elsif row[3].length == 5
                    print "           "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_by_gdp_industry_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_industry.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry ^    Service         Country  "
            puts "   Access         Access       Access     "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif collection[n][3].length == 3
                    print "             "
                elsif collection[n][3].length == 4
                    print "            "
                elsif collection[n][3].length == 5
                    print "           "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_by_gdp_industry_sort
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_industry.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry ^    Service         Country  "
            puts "   Access         Access        Access     "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif row[3].length == 3
                    print "             "
                elsif row[3].length == 4
                    print "            "
                elsif row[3].length == 5
                    print "           "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_by_gdp_service_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_service.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry      Service ^       Country  "
            puts "   Access         Access       Access    "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif collection[n][3].length == 3
                    print "             "
                elsif collection[n][3].length == 4
                    print "            "
                elsif collection[n][3].length == 5
                    print "           "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_by_gdp_service_sort
            collection = []
            self.all_without_world.sort_by { |country| country.internet_based_gdp_service.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_based_gdp_agriculture
                row << country.internet_based_gdp_industry
                row << country.internet_based_gdp_service
                collection << row
            end
            puts ""
            puts ""
            puts "         Internet Access Distribution by GDP Sector"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Agriculture     Industry      Service ^       Country  "
            puts "   Access         Access       Access    "
            puts "------------------------------------------------------------"
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
                    print "              "
                elsif row[3].length == 3
                    print "             "
                elsif row[3].length == 4
                    print "            "
                elsif row[3].length == 5
                    print "           "
                end
                    puts "#{row[0]}"
            end
        end

    end
end