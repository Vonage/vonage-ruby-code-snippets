require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.numbers.list()

  puts "Here are #{response.numbers.length} of your #{response.count} matching numbers:"
  
  response.numbers.each do |number|
    puts "Tel: #{number.msisdn} Type: #{number.type}"
  end
rescue
  puts "Error listing your owned numbers"
end 

