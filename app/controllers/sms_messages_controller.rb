require 'twilio-ruby'
# require './environment'
# require '../../config/environment'

class SmsMessagesController < ApplicationController

    def create
        # account_sid = "account_sid"
        # auth_token = "auth_token"
        # twilio_number = "+twilio_number"

        client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

        client.messages.create(
            from: ENV['TWILIO_NUMBER'],
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
