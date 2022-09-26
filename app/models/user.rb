class User < ApplicationRecord
    has_secure_password

    has_many :user_messages
    has_many :sms_messages, through: :user_messages
    has_one :profile

    validates :username, presence: true, uniqueness: true

end
