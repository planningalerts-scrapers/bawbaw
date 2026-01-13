Baw Baw Shire Council Planning Applications Scraper

* Cookie tracking - No
* Pagnation - No
* Javascript - No
* Clearly defined data within a row - Yes

This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)

Add any issues to https://github.com/planningalerts-scrapers/issues/issues

## To run the scraper

    bundle exec ruby scraper.rb

### Expected output

    Injecting configuration and compiling...
    Injecting scraper and running...
    Scraping page...
    Saving application: PLA0146/25
    Scraping complete!

Execution time: ~ 5 seconds

## To run style and coding checks

    bundle exec rubocop

## To check for security updates

    gem install bundler-audit
    bundle-audit
