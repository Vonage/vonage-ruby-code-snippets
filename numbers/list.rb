require 'dotenv/load'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
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

