require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
NEXMO_NUMBER = ENV['NEXMO_NUMBER']
NEXMO_NUMBER_TYPE = ENV['NEXMO_NUMBER_TYPE']
NEXMO_NUMBER_FEATURES = ENV['NEXMO_NUMBER_FEATURES']
NUMBER_SEARCH_CRITERIA = ENV['NUMBER_SEARCH_CRITERIA']
NUMBER_SEARCH_PATTERN = ENV['NUMBER_SEARCH_PATTERN']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.numbers.search(
    country: COUNTRY_CODE,
    msisdn: NEXMO_NUMBER,
    type: NEXMO_NUMBER_TYPE,
    features: NEXMO_NUMBER_FEATURES,
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