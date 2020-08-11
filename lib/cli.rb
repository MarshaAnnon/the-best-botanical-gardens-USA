class CLI

    def call
        Scraper.scrape_TheActiveTimes
        puts "\n \n  Hi, Welcome to The Best Botanical Gardens in America!".yellow.bold
        puts ""
        puts "  Which botanical garden would you like to learn more about?".yellow.bold
        puts ""
        list_gardens
        puts ""
        pick_garden 
    end

    def list_gardens
        Garden.all.each.with_index(1) do | garden, i |
            puts "  #{i}. #{garden.title}"
        end
    end

    def pick_garden
        puts ""
        puts "  Please choose a number for more info on a Botanical Garden:".yellow.bold
        input = gets.chomp
        if !input.to_i.between?(1, Garden.all.count)
            list_gardens
            puts ""
            puts "  Sorry, garden not found, please select another from the list".red.bold
            puts ""
            pick_garden   
        else  
            garden = Garden.all[input.to_i-1]
            puts ""
            puts "----------#{garden.title}----------".magenta.underline
            puts ""
            puts ""
            puts "#{garden.body}"
            puts ""
            puts "  Would you like to check out another garden?".yellow.bold
            puts ""
            puts "  Please type Y or N".yellow
            another_garden = gets.strip.downcase
        end

        if another_garden == "y"
            list_gardens
            pick_garden
        else 
            puts ""
            puts "  When nature smiles, we all smile :) I hope you found what your looking for!".magenta.bold
            puts ""
            exit
        end
    end
end
