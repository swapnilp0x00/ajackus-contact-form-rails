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
        allow_blank: true,
        length: { :minimum => 10, :maximum => 15 }


    after_create do
        ContactMailer.new_contact(self.id).deliver_now
    end
end    
