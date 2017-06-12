require 'dotenv'
require 'nexmo'

Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']

puts "Enter the application uuid."
uuid = gets.chomp

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET
)

response = client.delete_application(uuid)

puts response
