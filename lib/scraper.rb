class Scraper

    TheActiveTimes_URL = "https://www.theactivetimes.com/travel/best-botanical-gardens-us-gallery"
    
    def self.scrape_TheActiveTimes  
        html = open(TheActiveTimes_URL)
        doc = Nokogiri::HTML(html)
        doc.css(".slide-main").each do |garden_info|
            title = garden_info.css("div.image-title.slide-title h2").text
            body = garden_info.css("div.image-description.slide-description p").text
            garden = Garden.new(title, body)
        end   
    end 
end