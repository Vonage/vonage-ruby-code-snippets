require 'nexmo'

PRIVATE_KEY = File.read(PRIVATE_KEY_PATH)

client = Nexmo::Client.new(
  application_id: APPLICATION_ID,
  private_key: PRIVATE_KEY
)

client.create_call(
  from: { type: 'phone', number: FROM_NUMBER },
  to: [{ type: 'phone', number: TO_NUMBER }],
  answer_url: [
    'https://nexmo-community.github.io/ncco-examples/first_call_talk.json'
  ]
)
