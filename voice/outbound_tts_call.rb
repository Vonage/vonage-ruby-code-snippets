require 'dotenv'
require 'nexmo'

Dotenv.load

client = Nexmo::Client.new(
  application_id: ENV['APPLICATION_ID'],
  private_key: File.read(ENV['PRIVATE_KEY_PATH']),
)

client.create_call(
  from: { type: 'phone', number: ENV['FROM_NUMBER'] },
  to: [{ type: 'phone', number: ENV['TO_NUMBER'] }],
  answer_url: ['https://nexmo-community.github.io/ncco-examples/first_call_talk.json']
)
