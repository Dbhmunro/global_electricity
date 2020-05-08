require_relative "../global_electricity"

class Scrape
    
    def initialize
        access_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/251.html#XX"))
        fossil_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/257.html#XX"))
        nuclear_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/258.html#XX"))
        hydroelectric_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/259.html#XX"))
        other_renewable_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/260.html#XX"))
        # global_doc not necessary in the end
        # global_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/geos/xx.html"))
        
        #instantiate the countries and add the country names
        # access_doc.css("td.country").each do |td|
        #     country = Country.new
        #     country.name = td.css("a").text
        # end

        access_doc.css("tbody tr").each do |row|
            country = Country.new
            country.name = row.css("a").text
            electricity_access_data = {}
            row.css("div.category_data").each do |data|
                key = data.css("span.subfield-name").text
                value = data.css("span.subfield-number").text
                electricity_access_data[key] = value
            end
            country.population_electrification = electricity_access_data["electrification - total population:"]
            if (country.population_electrification == "100%")
                country.urban_electrification = "100%"
                country.rural_electrification = "100%"
                # country population without electricity = 0
            else
                country.urban_electrification = electricity_access_data["electrification - urban areas:"]
                if electricity_access_data["electrification - rural areas:"] == nil
                    country.rural_electrification = ((country.population_electrification.to_f*2) - country.urban_electrification.to_f)
                    country.rural_electrification = country.rural_electrification.to_s + "%"
                else
                    country.rural_electrification = electricity_access_data["electrification - rural areas:"]
                end
                # if (electricity_access_data["population without electricity:"] == nil)
                    # look up country popluation and multiply against population_electrification
                #else use the value to fill in country.population_without _electricity
            end
        end

        fossil_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.fossil_fuel_use = row.css("span.subfield-number").text.split(" of")[0]
            # elsif (country == nil)
            #     puts row.css("a").text
            end
                # binding.pry
        end
        
        nuclear_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.nuclear_fuel_use = row.css("span.subfield-number").text.split(" of")[0]
            # elsif (country == nil)
            #     puts row.css("a").text
            end
        end
        
        hydroelectric_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.hydroelectric_use = row.css("span.subfield-number").text.split(" of")[0]
            # elsif (country == nil)
            #     puts row.css("a").text
            end
        end
        
        other_renewable_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.other_renewable_use = row.css("span.subfield-number").text.split(" of")[0]
            # elsif (country == nil)
            #     puts row.css("a").text
            end
        end
        # binding.pry

        # electricity_access_data = {}
        # access_doc.css("div#field-electricity-access").each do |access|
        #     access.css("span.subfield-name")
        # end

    end
end