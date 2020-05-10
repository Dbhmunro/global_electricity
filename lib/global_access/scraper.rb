require_relative "../global_access"

class Scrape
    
    def initialize
        electricity_access_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/251.html#XX"))
        fossil_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/257.html#XX"))
        nuclear_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/258.html#XX"))
        hydroelectric_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/259.html#XX"))
        other_renewable_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/260.html#XX"))
        internet_access_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/204.html#XX"))
        broadband_internet_access_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/206.html#XX"))
        gdp_sectors_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/214.html#XX"))
        population_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/335.html#XX"))
        # global_doc not necessary in the end
        # global_doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/geos/xx.html"))
        

        electricity_access_doc.css("tbody tr").each do |row|
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

                if electricity_access_data["electrification - rural areas:"] == nil #built in to deal with Tuvalu missing data
                    country.rural_electrification = ((country.population_electrification.to_f*2) - country.urban_electrification.to_f)
                    country.rural_electrification = country.rural_electrification.to_s + "%"
                else
                    country.rural_electrification = electricity_access_data["electrification - rural areas:"]
                end

            end
        end

        fossil_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.fossil_fuel_use = row.css("span.subfield-number").text.split(" of")[0]
            end
                # binding.pry
        end
        
        nuclear_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.nuclear_fuel_use = row.css("span.subfield-number").text.split(" of")[0]
                
                country.non_renewable_use = (country.fossil_fuel_use.to_i + country.nuclear_fuel_use.to_i).to_s + "%"
            end
        end
        
        hydroelectric_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.hydroelectric_use = row.css("span.subfield-number").text.split(" of")[0]
            end
        end
        
        other_renewable_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.other_renewable_use = row.css("span.subfield-number").text.split(" of")[0]
                
                country.renewable_use = (country.hydroelectric_use.to_i + country.other_renewable_use.to_i).to_s + "%"
            end
        end
        
        internet_access_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                if (row.css("span.subfield-number").last != nil)
                    country.internet_access = row.css("span.subfield-number").last.text
                else
                    country.internet_access = row.css("span.subfield-note").last.text + "%"
                end
            end
        end
        
        population_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                country.population = row.css("span.subfield-number").text
            end
        end
        
        broadband_internet_access_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                # binding.pry
                if ((row.css("div.category_data.subfield.numeric").last.css("span.subfield-number")).length != 0)
                    country.broadband_access = row.css("div.category_data.subfield.numeric").last.css("span.subfield-number").last.text + "%"
                else
                    country.broadband_access = row.css("div.category_data.subfield.numeric").last.css("span.subfield-note").last.text + "%"
                end
                if country.broadband_access == "less than 1%"
                    if ((row.css("div.category_data.subfield.numeric").last.css("span.subfield-number")).length != 0)
                        pop_with_broadband = row.css("span.subfield-number").first.text.gsub(',','').to_f
                    else
                        pop_with_broadband = row.css("span.subfield-note").first.text.gsub(',','').to_f
                    end
                    pop_as_float = country.population.gsub(',','').to_f
                    
                    country.broadband_access = ((pop_with_broadband/pop_as_float)*100).round(1).to_s + "%"
                    if country.broadband_access == "0.0%"
                        country.broadband_access = "0%"
                    end
                end
                
                # if ((row.css("div.category_data.subfield.numeric").last.css("span.subfield-number")).length != 0)
                #     country.broadband_access = row.css("span.subfield-number").last.text + "%"
                # else
                #     if row.css("span.subfield-number").first == nil
                #         pop_with_broadband = row.css("span.subfield-note").first.text.gsub(',','').to_f
                #         pop_as_float = country.population.gsub(',','').to_f
                
                #         country.broadband_access = ((pop_with_broadband/pop_as_float)*100).round(1).to_s + "%"
                #     else
                #         pop_with_broadband = row.css("span.subfield-number").first.text.gsub(',','').to_f
                #         pop_as_float = country.population.gsub(',','').to_f
                
                #         country.broadband_access = ((pop_with_broadband/pop_as_float)*100).round(1).to_s + "%"
                #         if country.broadband_access == "0.0%"
                #             country.broadband_access = "0%"
                #         end
                #     end
                # end
            end
        end

        gdp_sectors_doc.css("tbody tr").each do |row|
            country = Country.all.find { |country| country.name == row.css("a").text }
            if (country != nil)
                # binding.pry
                
                gdp_sectors = {}

                row.css("div.category_data").each do |data|
                    key = data.css("span.subfield-name").text
                    if data.css("span.subfield-number").length != 0
                        value = data.css("span.subfield-number").text
                    else
                        value = data.css("span.subfield-note").text
                    end
                    gdp_sectors[key] = value
                end

                country.gdp_agriculture = gdp_sectors["agriculture:"]
                country.gdp_industry = gdp_sectors["industry:"]
                country.gdp_service = gdp_sectors["services:"]

                if ( Country.all_without_world.find { |c| c.name == country.name })
                    country.internet_based_gdp_agriculture = ((country.gdp_agriculture.to_f * country.internet_access.to_f)/100).round(1).to_s
                    country.internet_based_gdp_industry = ((country.gdp_industry.to_f * country.internet_access.to_f)/100).round(1).to_s
                    country.internet_based_gdp_service = ((country.gdp_service.to_f * country.internet_access.to_f)/100).round(1).to_s
                end
            end
        end

        # binding.pry
    end
end