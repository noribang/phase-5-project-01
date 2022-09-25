require 'twilio-ruby'
# require './environment'
# require '../../config/environment'

class SmsMessagesController < ApplicationController

    def create
        account_sid = "ACdd194483fec3b2f0395052f6601d3fef"
        auth_token = "b892a95b529a806b8401edde784d0584"
        twilio_number = "+15617828619"

        # client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

        # client.messages.create(
        #     from: TWILIO_NUMBER,
        #     to: sms_message_params['mobile_number'],
        #     body: sms_message_params['message']
        # )

        client = Twilio::REST::Client.new(account_sid, auth_token)

        client.messages.create(
            from: twilio_number,
            to: sms_message_params['mobile_number'],
            body: sms_message_params['message']
        )


        render json: client

    end

    private

    def sms_message_params
        params.require(:sms_message).permit(:mobile_number, :message)
    end
end
