require 'dotenv'
require 'nexmo'

Dotenv.load

APPLICATION_ID = ENV['APPLICATION_ID']
PRIVATE_KEY_PATH = ENV['PRIVATE_KEY_PATH']
FROM_NUMBER = ENV['FROM_NUMBER']
TO_NUMBER = ENV['FROM_NUMBER']

client = Nexmo::Client.new(
  application_id: APPLICATION_ID,
  private_key: File.read(PRIVATE_KEY_PATH),
)

client.create_call(
  from: { type: 'phone', number: FROM_NUMBER },
  to: [{ type: 'phone', number: TO_NUMBER }],
  answer_url: ['https://nexmo-community.github.io/ncco-examples/first_call_talk.json']
)
