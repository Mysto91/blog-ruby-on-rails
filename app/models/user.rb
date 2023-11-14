class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true

    def email=(value)
        super(value.strip.downcase)
    end
end
