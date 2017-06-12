require 'dotenv'
require 'nexmo'

Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']

puts "Enter the number to lookup, leading with the country code."

number = gets.chomp

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET
)

response = client.get_standard_number_insight(
  number: number
)

puts response