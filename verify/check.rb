require 'dotenv'
Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']
VERIFICATION_ID = ENV['VERIFICATION_ID']
VERIFICATION_CODE = ENV['VERIFICATION_CODE']

require 'nexmo'

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET
)

response = client.check_verification(
  VERIFICATION_ID,
  code: VERIFICATION_CODE
)

puts response
