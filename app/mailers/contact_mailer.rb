class ContactMailer < ApplicationMailer

    def new_contact
        puts params
        @contact = params[:contact]
        mail(to: 'swapnilp133@gmail.com', subject: 'New Form')
    end
end
