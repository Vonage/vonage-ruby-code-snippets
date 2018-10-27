# Nexmo Quickstart Examples for Ruby

Quickstarts also available for: [Java](https://github.com/nexmo-community/nexmo-java-quickstart), [.NET](https://github.com/nexmo-community/nexmo-dotnet-quickstart), [Node.js](https://github.com/nexmo-community/nexmo-node-quickstart), [PHP](https://github.com/nexmo-community/nexmo-php-quickstart), [Python](https://github.com/nexmo-community/nexmo-python-quickstart) 

The purpose of the quickstart guide is to provide simple examples focused
on one goal. For example, sending and SMS, handling and incoming SMS webhook,
making a Text to Speech call.

## Setup

To use this sample you will first need a [Nexmo account][sign-up]. Then rename
the `.env-example` file to `.env` and set the values as required.

For some of the examples you will need to [buy a number][buy-number].

## Running the Examples

Run the examples using the following replacing `/path/to/example.rb` with a path
to a real file:

```sh
ruby /path/to/example.rb
```
## Examples

### SMS

| Code Sample                              |
| ---------------------------------------- |
| [Send an SMS](sms/send.rb)   |
| [Receive an SMS](sms/receive.rb) |
| [Receive a Delivery Receipt](sms/delivery_receipt.rb)     |
| [Send Unicode SMS](sms/send-unicode-sms.rb) |

### Voice

| Code Sample                              |
| ---------------------------------------- |
| [Connect an inbound call](voice/connect_an_inbound_call.rb)      |
| [Download a recording](voice/download-a-recording.rb) |
| [Play Text-to-Speech](voice/play-text-to-speech-into-a-call.rb) |
| [Mute a Call](voice/mute-a-call.rb)   |
| [Join a Conference Call](voice/join_a_conference_call.rb)   |
| [Record a call](voice/record_a_call.rb) |
| [Record a message](voice/record-a-message.rb) |
| [Retrieve info for a call](voice/retrieve-info-for-a-call.rb) |
| [Transfer a call](voice/transfer-a-call.rb) |

### Verify

| Code Sample                              |
| ---------------------------------------- |
| [Send Phone Verification Code](verify/request.rb) |
| [Check Phone Verification Code](verify/check.rb) |
| [Cancel Phone Verification](verify/cancel.rb) |

## Request an Example

Please [raise and issue](https://github.com/nexmo-community/nexmo-node-quickstart/issues) to request an example that isn't present within
the quickstart. Pull requests will be gratefully received.

## License

[MIT](LICENSE)

[sign-up]: https://dashboard.nexmo.com/sign-up
[buy-number]: https://dashboard.nexmo.com/buy-numbers
