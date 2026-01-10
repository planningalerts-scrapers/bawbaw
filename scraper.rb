require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

def scrape_page(page, url)
  table = page.at("tbody")
  
  table.search("tr").each do |tr|
    record = {
      "info_url" => url,
      "comment_url" => url,
      "council_reference" => tr.search("td")[0].inner_text.split("(")[0],
      "address" => tr.search("td")[1].inner_text + ", VIC",
      "description" => tr.search("td")[2].inner_text,
      "date_scraped" => Date.today.to_s
    }
    puts "Saving application: #{record['council_reference']}"
    ScraperWiki.save_sqlite(['council_reference'], record)
  end
end

url = "http://www.bawbawshire.vic.gov.au/Building-and-Planning/Planning/List-of-Current-Planning-Permit-Applications-on-Exhibition"
page = agent.get(url)

puts "Scraping page..."

scrape_page(page, url)

puts "Scraping complete!"

puts "PAGE.BODY:", page.body if ENV['DEBUG']

