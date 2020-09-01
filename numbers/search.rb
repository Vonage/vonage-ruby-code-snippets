require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
VONAGE_NUMBER = ENV['VONAGE_NUMBER']
VONAGE_NUMBER_TYPE = ENV['VONAGE_NUMBER_TYPE']
VONAGE_NUMBER_FEATURES = ENV['VONAGE_NUMBER_FEATURES']
NUMBER_SEARCH_CRITERIA = ENV['NUMBER_SEARCH_CRITERIA']
NUMBER_SEARCH_PATTERN = ENV['NUMBER_SEARCH_PATTERN']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.numbers.search(
    country: COUNTRY_CODE,
    msisdn: VONAGE_NUMBER,
    type: VONAGE_NUMBER_TYPE,
    features: VONAGE_NUMBER_FEATURES,
    pattern: NUMBER_SEARCH_CRITERIA,
    search_pattern: NUMBER_SEARCH_PATTERN
  )

  puts "Your search returned #{response.numbers.length} of the #{response.count} matching numbers available for purchase:"

  response.numbers.each do |number|
    puts "Tel: #{number.msisdn} Cost: #{number.cost}"
  end
rescue
  puts "Error searching numbers"
end