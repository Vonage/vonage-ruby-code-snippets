require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
NEXMO_NUMBER = ENV['NEXMO_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']

require 'nexmo'

client = Nexmo::Client.new(
  key: NEXMO_API_KEY,
  secret: NEXMO_API_SECRET
)

client.send_message(
  from: NEXMO_NUMBER,
  to: TO_NUMBER,
  text: 'Hello from Nexmo!'
)
