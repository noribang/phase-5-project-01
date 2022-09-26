class UserMessage < ApplicationRecord
    belongs_to :user
    belongs_to :sms_message
end
