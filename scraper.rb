require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

def scrape_page(page, url)
  table = page.at("tbody")
  
  table.search("tr")[0..-1].each do |tr|
    record = {
      "info_url" => url,
      "comment_url" => url,
      "council_reference" => tr.search("td")[0].inner_text.split("(")[0],
      "address" => tr.search("td")[1].inner_text + ", VIC",
      "description" => tr.search("td")[2].inner_text,
      "date_scraped" => Date.today.to_s
    }
    
    # Check if record already exists
    if (ScraperWiki.select("* from data where `council_reference`='#{record['council_reference']}'").empty? rescue true)
      ScraperWiki.save_sqlite(['council_reference'], record)
    else
      puts "Skipping already saved record " + record['council_reference']
    end
  end
end

url = "http://www.bawbawshire.vic.gov.au/Building-and-Planning/Planning/Current-Applications-on-Exhibition/List-of-Current-Planning-Permit-Applications-on-Exhibition"
page = agent.get(url)
puts "Scraping page..."
scrape_page(page, url)
