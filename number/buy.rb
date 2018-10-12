require 'dotenv'
require 'nexmo'

Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']

puts "Enter the country code."
country = gets.chomp

puts "Enter the phone number's msisdn."
msisdn = gets.chomp

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET
)

response = client.buy_number(country: country, msisdn: msisdn)

# NOTE: Even though the operation was succesful, the response will look like:
# {"error-code"=>"200", "error-code-label"=>"success"}
puts response