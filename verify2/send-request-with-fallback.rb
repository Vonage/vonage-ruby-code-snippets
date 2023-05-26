require 'vonage'

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

client.verify2.start_verification(
  brand: BRAND_NAME,
  workflow: [
    {channel: 'silent_auth', to: TO_NUMBER},
    {channel: 'email', to: TO_EMAIL, from: FROM_EMAIL}
  ]
)
