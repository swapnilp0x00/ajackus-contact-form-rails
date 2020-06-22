class ContactMailer < ApplicationMailer

    def new_contact
        puts params
        @contact = params[:contact]
        mail(to: 'swapnilp133@gmail.com, info@ajackus.com', subject: 'New Contact!!!')
    end
end
