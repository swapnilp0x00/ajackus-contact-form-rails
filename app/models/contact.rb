class Contact < ApplicationRecord
    class Contact < ApplicationRecord
        validates :email,
            presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP } 
        validates :first_name,
            presence: true, length: {maximum: 30}
        validates :last_name,
            presence: true, length: {maximum: 30}
        validates :message,
            presence: true, length: {minimum: 10, maximum: 500}
        validates :phone,
            numericality: true,
            allow_nil: true,
            length: { :minimum => 10, :maximum => 15 }
    
    
        after_create do
            puts "***Mailer Code....***"
            ContactMailer.with(contact: self).new_contact.deliver_now
        end
    end    
end
