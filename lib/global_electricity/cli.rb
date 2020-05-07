class GlobalElectricity::CLI

    def call
        # methods for program
        scrape
        welcome
        menu
        goodbye
    end
    
    def scrape # implement system "clear" after development
        # system "clear"
        puts "Please wait while we collect your data..."
        Scrape.new
        # system "clear"
    end

    def welcome
        puts <<~HEREDOC
            Welcome to Global Electicity Statistics
            
            #{Country.select_country("World").population_electrification} - Of the world's population has access to electricity
            -  #{Country.select_country("World").urban_electrification} are urban areas
            -  #{Country.select_country("World").rural_electrification} are rural areas

            World's energy sources are currently:
            #{Country.select_country("World").fossil_fuel_use} fossil fuels
            #{Country.select_country("World").nuclear_fuel_use} nuclear fuels
            #{Country.select_country("World").hydroelectric_use} hydroelectric
            #{Country.select_country("World").other_renewable_use} other renewable sources
            
        HEREDOC
    end

    def menu
        @input = nil
        while @input != "exit"
            puts <<~HEREDOC
               
                Main menu choices:
                - 1. Access to electricity
                - 2. Electricity from fossil fuels
                - 3. Electricity from nuclear fuels
                - 4. Electricity from hydroelectric plants
                - 5. Electricity from other renewable sources
                - 6. See statistics for a country
                At any time type exit to quit the program

                Your selection:
            HEREDOC
            @input = gets.strip.downcase
            case @input
            when "1"
                puts "Access to electricity"
                access_to_electricity
            when "2"
                puts "Electricity from fossil fuels"
            when "3"
                puts "Electricity from nuclear fuels"
            when "4"
                puts "Electricity from hydroelectric plants"
            when "5"
                puts "Electricity from other renewable sources"
            when "6"
                puts "See statistics for a country"
            # when "exit"
            #     print "Goodbye. "
            else
                puts "Invalid input"
                welcome
            end
        end
    end

    def access_to_electricity
        while @input != "exit"
            puts <<~HEREDOC
                
                Main menu choices:
                - 1. View sorted by urban area electrification (highest to lowest)
                - 2. View sorted by rural area electrification (highest to lowest)
                - Type a coutry name to see its full details
                - 0. Return to main menu

                Your selection:
            HEREDOC
            @input = gets.strip.downcase
            case @input
            when "1"
                puts "View sorted by urban area electrification"
            when "2"
                puts "View sorted by rural area electrification"
            when *Country.country_names
                puts "Details for specific country"
            when "0"
                menu
            else
                puts "Invalid input"
            end
        end
    end

    def goodbye
        puts ""
        puts "May the search for knowledge be fruitful."
    end

end