class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    
    before_validation :normalize_email

    def self.authenticate(email, password)
        user = find_by(email: email)
        user && user.authenticate(password)
    end

    

    private

    def normalize_email
        self.email = email.strip.downcase if email.present?
    end
    
end
   
 
