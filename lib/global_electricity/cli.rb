class GlobalElectricity::CLI

    def call
        # methods for program
        scrape
        welcome
        menu
        goodbye
    end
    
    def scrape
        puts "Please wait while we collect your data..."
        # GlobalElectricity::Scrape.new
    end

    def welcome
        puts <<~HEREDOC
            Welcome to Global Electicity Statistics
            global data here
        HEREDOC
    end

    def menu
        input = nil
        while input != "exit"
            puts <<~HEREDOC
                Main menu choices:
                - 1. Access to electricity
                - 2. Electricity from fossil fuels
                - 3. Electricity from nuclear fuels
                - 4. Electricity from hydroelectric plants
                - 5. Electricity from other renewable sources
                - 6. See statistics for a country
                - At any time type exit to quit the program
            HEREDOC
            input = gets.strip.downcase
            case input
            when "1"
                puts "Access to electricity"
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
            when "exit"
                puts "Goodbye"
            else
                puts "Invalid input"
                welcome
            end
        end
    end

    def goodbye
        puts "May the search for knowledge be fruitful."
    end

end