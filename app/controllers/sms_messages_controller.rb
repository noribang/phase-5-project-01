require 'twilio-ruby'
# require './environment'
# require '../../config/environment'

class SmsMessagesController < ApplicationController

    def create
        account_sid = "account_sid"
        auth_token = "auth_token"
        twilio_number = "twilio_number"

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
