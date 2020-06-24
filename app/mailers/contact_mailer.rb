class ContactMailer < ApplicationMailer

    def new_contact(id)
        @contact = Contact.find(id)
        mail(to: 'swapnilp133@gmail.com, info@ajackus.com', subject: 'New Contact!!!')
    end
end
