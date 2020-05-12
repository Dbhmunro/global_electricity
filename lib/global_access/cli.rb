class CLI

    def call
        scrape
        welcome
        menu
        goodbye
    end
    
    def scrape # implement system "clear" after development
        system "clear"
        puts "Please wait while we collect your data..."
        Scrape.new
        system "clear"
    end

    def welcome
        puts <<~HEREDOC

            Welcome to Global Access to Technology Statistics!

            ~Your statistical data on internet, energy, and economy
            Providing the data you need to find the right countries to market your web applications

            We help you find the countries who have the internet access needed and
            have the right primary economic sector for the target of your application.
            We also help you make decisions when looking for green energy markets.

            
            Global Access to Internet:
            #{Country.select_country("World").internet_access} Of the Population
            -  #{Country.select_country("World").broadband_access} Population with Broadband Access

            Global Access to Electricity:
            #{Country.select_country("World").population_electrification} Of the Population
            -  #{Country.select_country("World").urban_electrification} Are Urban Areas
            -  #{Country.select_country("World").rural_electrification} Are Rural Areas

            Global Energy Sources are Currently:
            #{Country.select_country("World").fossil_fuel_use} Fossil Fuels
            #{Country.select_country("World").nuclear_fuel_use} Nuclear Fuels
            #{Country.select_country("World").hydroelectric_use} Hydroelectric
            #{Country.select_country("World").other_renewable_use} Other Renewable Sources

            Global % Gross Domestic Product(GDP), by Sector:
            #{Country.select_country("World").gdp_agriculture} Agriculture - #{Country.select_country("World").gdp_industry} Industry - #{Country.select_country("World").gdp_service} Service
            
        HEREDOC
        @input = nil
    end

    def menu
        #ought to have, better descriptions for the data
        #ought to have, improved introduction
        #nice to have, add ability for partial country search, starts with or contains
        #nice to have, system "clear" between lists, but not when calling up specific country details
        #nice to have, in tables, sub-sort equal values alphabetically
        #nice to have, make country names first column in all tables while preserving table shape
        #nice to have, more stylized menus and tables
        while @input != "exit"
            puts <<~HEREDOC
               
                Main Select Menu - List of Countries with:
                - 1. Population Access to Internet
                - 2. Population Access to Electricity
                - 3. Electricity Production, % by Source Energy
                - 4. Gross Domestic Product (GDP), % by Sector
                - 5. Green Electricity Production and Internet Access
                - 6. Internet Access Distribution by GDP Sector
                - 7. All Statistics - Search by Country
                At any time type EXIT to quit the program

                Your Selection:
            HEREDOC
            @input = gets.strip.downcase
            case @input
            when "1"
                access_to_internet
            when "2"
                access_to_electricity
            when "3"
                sources_of_electricity
            when "4"
                gdp_composition
            when "5"
                internet_and_green_electricity
            when "6"
                internet_by_gdp
            when "7"
                country_list
            when "exit"
                puts "Goodbye."
            else
                puts "Please enter a valid selection."
                sleep 1.2
            end
        end
    end

    def access_to_internet
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.internet_access_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Population Access to Internet - Descending
                    - 3. Population Access to Broadband Internet - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.internet_access_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Population Access to Internet - Descending
                    - 3. Population Access to Broadband Internet - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.internet_access_population_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Population Access to Broadband Internet - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.internet_access_population_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Population Access to Broadband Internet - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.internet_access_broadband_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.internet_access_broadband_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            end
        end
    end

    def access_to_electricity
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.electricity_access_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Population Access to Electricity - Descending
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.electricity_access_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Population Access to Electricity - Descending
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.electricity_access_population_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.electricity_access_population_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.electricity_access_urban_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Electricity - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.electricity_access_urban_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Electricity - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 4. Rural Area Access to Electricity - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "7"
                Country.electricity_access_rural_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Electricity - Descending
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "8"
                Country.electricity_access_rural_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Electricity - Descending
                    - 3. Urban Area Access to Electricity - Descending
                    - 4. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            end
        end
    end
    
    def sources_of_electricity
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.electricity_sources_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.electricity_sources_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.electricity_sources_fossil_fuel_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.electricity_sources_fossil_fuel_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.electricity_sources_nuclear_fuel_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.electricity_sources_nuclear_fuel_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "7"
                Country.electricity_sources_hydroelectric_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. CURRENT VIEW - Select for Full List
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "8"
                Country.electricity_sources_hydroelectric_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. CURRENT VIEW - Select for Top 20 List
                    - 5. Other Renewable Sources Electricity Generation - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            when "9"
                Country.electricity_sources_other_renewable_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when "5"
                    screen = "10"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "10"
                Country.electricity_sources_other_renewable_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Fossil Fuel Electricity Generation - Descending
                    - 3. Nuclear Fuel Electricity Generation - Descending
                    - 4. Hydroelectric Power Generation - Descending
                    - 5. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when "5"
                    screen = "9"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            end
        end
    end
    
    def gdp_composition
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.gdp_composition_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. Industry Sector GDP% - Descending
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.gdp_composition_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. Industry Sector GDP% - Descending
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.gdp_composition_agriculture_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Industry Sector GDP% - Descending
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.gdp_composition_agriculture_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Industry Sector GDP% - Descending
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.gdp_composition_industry_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.gdp_composition_industry_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 4. Service Sector GDP% - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "7"
                Country.gdp_composition_service_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. Industry Sector GDP% - Descending
                    - 4. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "8"
                Country.gdp_composition_service_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Agriculture Sector GDP% - Descending
                    - 3. Industry Sector GDP% - Descending
                    - 4. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            end
        end
    end

    def internet_and_green_electricity
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.internet_and_energy_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Population Access to Internet - Descending
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.internet_and_energy_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Population Access to Internet - Descending
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.internet_and_energy_access_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.internet_and_energy_access_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.internet_and_energy_renewable_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.internet_and_energy_renewable_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 4. Electricity from Non-Renewable Sources - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "7"
                Country.internet_and_energy_non_renewable_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "8"
                Country.internet_and_energy_non_renewable_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Population Access to Internet - Descending
                    - 3. Electricity from Renewable Sources - Descending
                    - 4. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            end
        end
    end

    def internet_by_gdp
        screen = "1"
        while @input != "exit"
            case screen
            when "1" #short list alphabetical country name ascending
                # system "clear"
                Country.internet_by_gdp_alphabetical_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Full List
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to Main Menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "2"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "2" #full list alphabetical country name ascending
                # system "clear"
                Country.internet_by_gdp_alphabetical_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. CURRENT VIEW - Select for Top 20 List
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "3"
                Country.internet_by_gdp_agriculture_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Full List
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "4"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "4"
                Country.internet_by_gdp_agriculture_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. CURRENT VIEW - Select for Top 20 List
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "5"
                Country.internet_by_gdp_industry_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. CURRENT VIEW - Select for Full List
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "6"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "6"
                Country.internet_by_gdp_industry_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. CURRENT VIEW - Select for Top 20 List
                    - 4. Internet Access in Relation to %GDP in Services - Descending
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "7"
                Country.internet_by_gdp_service_sort_short
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. CURRENT VIEW - Select for Full List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "8"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2
                end
            when "8"
                Country.internet_by_gdp_service_sort
                puts <<~HEREDOC
                    
                    Enter Number to Sort Countries by:
                    - 1. Country Name - Ascending
                    - 2. Internet Access in Relation to %GDP in Agriculture - Descending
                    - 3. Internet Access in Relation to %GDP in Industry - Descending
                    - 4. CURRENT VIEW - Select for Top 20 List
                    - 0. Return to main menu

                    To View All Statistics for a Country:
                    - Type a Full Country Name

                    Your Selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    screen = "1"
                when "2"
                    screen = "3"
                when "3"
                    screen = "5"
                when "4"
                    screen = "7"
                when *Country.country_names_for_search
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                    sleep 1.2  
                end
            end
        end
    end

    def country_list
        while @input != "exit"
            Country.present_country_list
            puts <<~HEREDOC
               
                Of the countries listed, please enter the number or name for the country of interest.
                Or, enter 0 for the main menu.

                Your Selection:
            HEREDOC
            @input = gets.strip.downcase
            # binding.pry
            if  (Country.country_names_for_search.include?(@input) || @input.to_i.between?(1, (Country.all_without_world.length)))
                country_details
            elsif @input == "0"
                menu
            elsif @input == "exit"
                puts "Goodbye."
            else
                puts "Please enter a valid selection."
                sleep 1.2
            end
        end
    end

    def country_details
        while @input != "exit"
            Country.present_country(@input)
            puts <<~HEREDOC
               
            Menu choices:
            - 1. View list of countries
            - Type another coutry name to see its full details
            - 0. Return to main menu

                Your Selection:
            HEREDOC
            prev_input = @input
            @input = gets.strip.downcase
            case @input
            when "1"
                country_list
            when *Country.country_names_for_search
                country_details
            when "0"
                menu
            when "exit"
                puts "Goodbye."
            else
                @input = prev_input
                puts "Please enter a valid selection."
                sleep 1.2
            end
        end
    end


    def goodbye
        puts ""
        puts "May the search for knowledge be fruitful."
    end

end