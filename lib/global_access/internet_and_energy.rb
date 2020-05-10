module InternetAndEnergy
    module ClassMethods
        # these methods will only work in the Country class
        # variables internet_access, renewable_use, non_renewable_use


        def internet_and_energy_alphabetical_sort_short
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                    (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from     Energy from     Country ^ "
            puts "  Access       Renewable     Non-Renewable      "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print "  #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "             "
                elsif collection[n][1].length == 3
                    print "            "
                elsif collection[n][1].length == 4
                    print "           "
                elsif collection[n][1].length == 5
                    print "          "
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
                    print "             "
                elsif collection[n][3].length == 3
                    print "            "
                elsif collection[n][3].length == 4
                    print "           "
                elsif collection[n][3].length == 5
                    print "          "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_and_energy_alphabetical_sort
            collection = []
            self.all_without_world.sort_by(&:name).collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from     Energy from     Country ^ "
            puts "  Access       Renewable     Non-Renewable      "
            puts "------------------------------------------------------------"
            collection.each do |row| #nice to have, add a new column header after so many rows (standard screen height)
                print "  #{row[1]}"
                if row[1].length == 2
                    print "             "
                elsif row[1].length == 3
                    print "            "
                elsif row[1].length == 4
                    print "           "
                elsif row[1].length == 5
                    print "          "
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
                    print "             "
                elsif row[3].length == 3
                    print "            "
                elsif row[3].length == 4
                    print "           "
                elsif row[3].length == 5
                    print "          "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_and_energy_access_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.internet_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                    (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Internet ^   Energy from     Energy from     Country  "
            puts "  Access       Renewable     Non-Renewable     "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print "  #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "             "
                elsif collection[n][1].length == 3
                    print "            "
                elsif collection[n][1].length == 4
                    print "           "
                elsif collection[n][1].length == 5
                    print "          "
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
                    print "             "
                elsif collection[n][3].length == 3
                    print "            "
                elsif collection[n][3].length == 4
                    print "           "
                elsif collection[n][3].length == 5
                    print "          "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_and_energy_access_sort
            collection = []
            self.all_without_world.sort_by { |country| country.internet_access.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Internet ^   Energy from     Energy from     Country  "
            puts "  Access       Renewable     Non-Renewable     "
            puts "------------------------------------------------------------"
            collection.each do |row|
                print "  #{row[1]}"
                if row[1].length == 2
                    print "             "
                elsif row[1].length == 3
                    print "            "
                elsif row[1].length == 4
                    print "           "
                elsif row[1].length == 5
                    print "          "
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
                    print "             "
                elsif row[3].length == 3
                    print "            "
                elsif row[3].length == 4
                    print "           "
                elsif row[3].length == 5
                    print "          "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_and_energy_renewable_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                    (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from ^   Energy from     Country  "
            puts "  Access       Renewable     Non-Renewable     "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print "  #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "             "
                elsif collection[n][1].length == 3
                    print "            "
                elsif collection[n][1].length == 4
                    print "           "
                elsif collection[n][1].length == 5
                    print "          "
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
                    print "             "
                elsif collection[n][3].length == 3
                    print "            "
                elsif collection[n][3].length == 4
                    print "           "
                elsif collection[n][3].length == 5
                    print "          "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_and_energy_renewable_sort
            collection = []
            self.all_without_world.sort_by { |country| country.renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from ^   Energy from     Country  "
            puts "  Access       Renewable     Non-Renewable     "
            puts "------------------------------------------------------------"
            collection.each do |row|
                print "  #{row[1]}"
                if row[1].length == 2
                    print "             "
                elsif row[1].length == 3
                    print "            "
                elsif row[1].length == 4
                    print "           "
                elsif row[1].length == 5
                    print "          "
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
                    print "             "
                elsif row[3].length == 3
                    print "            "
                elsif row[3].length == 4
                    print "           "
                elsif row[3].length == 5
                    print "          "
                end
                    puts "#{row[0]}"
            end
        end

        def internet_and_energy_non_renewable_sort_short
            collection = []
            self.all_without_world.sort_by { |country| country.non_renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                    (Top 20 List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from     Energy from ^   Country  "
            puts "  Access       Renewable     Non-Renewable    "
            puts "------------------------------------------------------------"
            (1..20).each do |n|
                print "  #{collection[n][1]}"
                if collection[n][1].length == 2
                    print "             "
                elsif collection[n][1].length == 3
                    print "            "
                elsif collection[n][1].length == 4
                    print "           "
                elsif collection[n][1].length == 5
                    print "          "
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
                    print "             "
                elsif collection[n][3].length == 3
                    print "            "
                elsif collection[n][3].length == 4
                    print "           "
                elsif collection[n][3].length == 5
                    print "          "
                end
                    puts "#{collection[n][0]}"
            end
        end

        def internet_and_energy_non_renewable_sort
            collection = []
            self.all_without_world.sort_by { |country| country.non_renewable_use.to_f }.reverse.collect do |country|
                row = []
                row << country.name
                row << country.internet_access
                row << country.renewable_use
                row << country.non_renewable_use
                collection << row
            end
            puts ""
            puts ""
            puts "   Green Electricity Production and Internet Access"
            puts "                     (Full List)"
            puts "------------------------------------------------------------"
            puts " Internet     Energy from     Energy from ^   Country  "
            puts "  Access       Renewable     Non-Renewable    "
            puts "------------------------------------------------------------"
            collection.each do |row|
                print "  #{row[1]}"
                if row[1].length == 2
                    print "             "
                elsif row[1].length == 3
                    print "            "
                elsif row[1].length == 4
                    print "           "
                elsif row[1].length == 5
                    print "          "
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
                    print "             "
                elsif row[3].length == 3
                    print "            "
                elsif row[3].length == 4
                    print "           "
                elsif row[3].length == 5
                    print "          "
                end
                    puts "#{row[0]}"
            end
        end

    end
end