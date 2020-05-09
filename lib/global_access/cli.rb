class CLI

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
            Welcome to Global Access to Technology Statistics
            ~Your statistical data on internet, energy, and economy
            Finding the countries that have larger percentages of internet and electricity access
            and help you determine the primary economic sector to target for your web application development
            or find the countries with largest percentage of economic sector 
            With the energy data you can make informed decisions on green markets if you wish
            

            

            - #{Country.select_country("World").population_electrification} - Of the world's population has access to electricity
            -   #{Country.select_country("World").urban_electrification} are urban areas
            -   #{Country.select_country("World").rural_electrification} are rural areas

            World's energy sources are currently:
            #{Country.select_country("World").fossil_fuel_use} fossil fuels
            #{Country.select_country("World").nuclear_fuel_use} nuclear fuels
            #{Country.select_country("World").hydroelectric_use} hydroelectric
            #{Country.select_country("World").other_renewable_use} other renewable sources
            
        HEREDOC
        @input = nil
    end

    def menu #nice to have, add ability for partial country search, starts with or contains
        while @input != "exit"
            puts <<~HEREDOC
               
                Main menu choices:
                - 1. Access to internet
                - 2. Access to electricity
                - 3. Sources of electricity
                - 4. GDP composition by sector
                - 5. Analysis - population with internet and energy
                - 6. Analysis - aggregating economic data with population access to internet
                - 7. Find country statistics
                At any time type exit to quit the program

                Your selection:
            HEREDOC
            @input = gets.strip.downcase
            case @input
            when "1"
                puts "Access to internet"
                #access_to_internet
            when "2"
                access_to_electricity
            when "3"
                sources_of_electricity
            when "4"
                puts "GDP composition"
                #gdp_composition
            when "5"
                puts "Analysis - population with access to technological advances"
            when "6"
                puts "Analysis - economic production with internet access"
            when "7"
                country_list
            when "exit"
                puts "Goodbye."
            else
                puts "Please enter a valid selection."
                sleep 1.5
            end
        end
    end

    def access_to_electricity #keep the menu options the same, but just add qualifier that menu choice is current
        #change menu so that it only shows top 20, and then on selecting the same menu again, you can see the full list of countries
        screen = "1"
        while @input != "exit"
            case screen
            when "1"
                # system "clear"
                Country.access_alphabetical_sort
                puts <<~HEREDOC
                    
                    Menu choices:
                    - 1. View sorted by total access to electricity (highest to lowest)
                    - 2. View sorted by urban area electrification (highest to lowest)
                    - 3. View sorted by rural area electrification (highest to lowest)
                    - Type a coutry name to see its full details
                    - 0. Return to main menu

                    Your selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    puts "View sorted by total access to electricity (highest to lowest)"
                    screen = "2"
                when "2"
                    puts "View sorted by urban area electrification (highest to lowest)"
                    screen = "3"
                when "3"
                    puts "View sorted by rural area electrification (highest to lowest)"
                    screen = "4"
                when *Country.country_names
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                sleep 1.5
                end
            when "2"
                Country.access_population_sort
                puts <<~HEREDOC
                    
                    Menu choices:
                    - 1. View sorted alphabetically
                    - 2. View sorted by urban area electrification (highest to lowest)
                    - 3. View sorted by rural area electrification (highest to lowest)
                    - Type a coutry name to see its full details
                    - 0. Return to main menu

                    Your selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    puts "View sorted alphabetically"
                    screen = "1"
                when "2"
                    puts "View sorted by urban area electrification (highest to lowest)"
                    screen = "3"
                when "3"
                    puts "View sorted by rural area electrification (highest to lowest)"
                    screen = "4"
                when *Country.country_names
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                sleep 1.5
                end
            when "3"
                Country.access_urban_sort
                puts <<~HEREDOC
                    
                    Menu choices:
                    - 1. View sorted alphabetically
                    - 2. View sorted by total access to electricity (highest to lowest)
                    - 3. View sorted by rural area electrification (highest to lowest)
                    - Type a coutry name to see its full details
                    - 0. Return to main menu

                    Your selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    puts "View sorted alphabetically"
                    screen = "1"
                when "2"
                    puts "View sorted by total access to electricity (highest to lowest)"
                    screen = "2"
                when "3"
                    puts "View sorted by rural area electrification (highest to lowest)"
                    screen = "4"
                when *Country.country_names
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                sleep 1.5
                end
            when "4"
                Country.access_rural_sort
                puts <<~HEREDOC
                    
                    Menu choices:
                    - 1. View sorted alphabetically
                    - 2. View sorted by access to electricity (highest to lowest)
                    - 3. View sorted by urban area electrification (highest to lowest)
                    - Type a coutry name to see its full details
                    - 0. Return to main menu

                    Your selection:
                HEREDOC
                @input = gets.strip.downcase
                case @input
                when "1"
                    puts "View sorted alphabetically"
                    screen = "1"
                when "2"
                    puts "View sorted by access to electricity (highest to lowest)"
                    screen = "2"
                when "3"
                    puts "View sorted by urban area electrification (highest to lowest)"
                    screen = "3"
                when *Country.country_names
                    country_details
                when "0"
                    menu
                when "exit"
                    puts "Goodbye."
                else
                    puts "Please enter a valid selection."
                sleep 1.5
                end
            end
        end
    end

    # def fossil_fuel_electricity
    #     screen = "1"
    #     while @input != "exit"
    #         case screen
    #         when "1"
    #             puts <<~HEREDOC
                    
    #                 Countries listed in alphabetical order
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted lowest to highest
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "2"
    #             puts <<~HEREDOC
                    
    #                 Countries listed highest to lowest
                    
    #                 Menu choices:
    #                 - 1. View sorted lowest to highest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "3"
    #             puts <<~HEREDOC
                    
    #                 Countries listed lowest to highest
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         end
    #     end
    # end

    # def nuclear_fuel_electricity
    #     screen = "1"
    #     while @input != "exit"
    #         case screen
    #         when "1"
    #             puts <<~HEREDOC
                    
    #                 Countries listed in alphabetical order
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted lowest to highest
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "2"
    #             puts <<~HEREDOC
                    
    #                 Countries listed highest to lowest
                    
    #                 Menu choices:
    #                 - 1. View sorted lowest to highest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "3"
    #             puts <<~HEREDOC
                    
    #                 Countries listed lowest to highest
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         end
    #     end
    # end

    # def hydroelectric_electricity
    #     screen = "1"
    #     while @input != "exit"
    #         case screen
    #         when "1"
    #             puts <<~HEREDOC
                    
    #                 Countries listed in alphabetical order
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted lowest to highest
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "2"
    #             puts <<~HEREDOC
                    
    #                 Countries listed highest to lowest
                    
    #                 Menu choices:
    #                 - 1. View sorted lowest to highest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "3"
    #             puts <<~HEREDOC
                    
    #                 Countries listed lowest to highest
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         end
    #     end
    # end

    # def other_renewable_electricity
    #     screen = "1"
    #     while @input != "exit"
    #         case screen
    #         when "1"
    #             puts <<~HEREDOC
                    
    #                 Countries listed in alphabetical order
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted lowest to highest
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "2"
    #             puts <<~HEREDOC
                    
    #                 Countries listed highest to lowest
                    
    #                 Menu choices:
    #                 - 1. View sorted lowest to highest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted lowest to highest"
    #                 screen = "3"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         when "3"
    #             puts <<~HEREDOC
                    
    #                 Countries listed lowest to highest
                    
    #                 Menu choices:
    #                 - 1. View sorted highest to lowest
    #                 - 2. View sorted alphabetically
    #                 - Type a coutry name to see its full details
    #                 - 0. Return to main menu

    #                 Your selection:
    #             HEREDOC
    #             @input = gets.strip.downcase
    #             case @input
    #             when "1"
    #                 puts "View sorted highest to lowest"
    #                 screen = "2"
    #             when "2"
    #                 puts "View sorted alphabetically"
    #                 screen = "1"
    #             when *Country.country_names
    #                 country_details
    #             when "0"
    #                 menu
    #             when "exit"
    #                 puts "Goodbye."
    #             else
    #                 puts "Please enter a valid selection."
    #             sleep 1.5
    #             end
    #         end
    #     end
    # end

    def country_list
        while @input != "exit"
            Country.present_country_list
            puts <<~HEREDOC
               
                Of the countries listed, please enter the number or name for the country of interest.
                Or, enter 0 for the main menu.

                Your selection:
            HEREDOC
            @input = gets.strip.downcase
            # binding.pry
            if  (Country.country_names.include?(@input) || @input.to_i.between?(1, (Country.all_without_world.length)))
                country_details
            elsif @input == "0"
                menu
            elsif @input == "exit"
                puts "Goodbye."
            else
                puts "Please enter a valid selection."
                sleep 1.5
            end
        end
    end

    def country_details
        while @input != "exit"
            puts "Details for specific country"
            puts <<~HEREDOC
               
            Menu choices:
            - 1. View list of countries
            - Type another coutry name to see its full details
            - 0. Return to main menu

                Your selection:
            HEREDOC
            @input = gets.strip.downcase
            case @input
            when "1"
                country_list
            when *Country.country_names
                country_details
            when "0"
                menu
            when "exit"
                puts "Goodbye."
            else
                puts "Please enter a valid selection."
                sleep 1.5
            end
        end
    end

    def goodbye
        puts ""
        puts "May the search for knowledge be fruitful."
    end

end