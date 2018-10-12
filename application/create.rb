require 'dotenv'
require 'nexmo'

Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']

puts "Enter the application name."
name = gets.chomp

puts "Enter the answer url."
answer_url = gets.chomp

puts "Enter the event url."
event_url = gets.chomp

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET
)

response = client.create_application(
	name: name,
	type: 'voice',
	answer_url: answer_url,
	event_url: event_url)

puts response
