require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

SECRET_ID = ENV['NEXMO_SECRET_ID']

require 'nexmo'

client.secrets.get(SECRET_ID)