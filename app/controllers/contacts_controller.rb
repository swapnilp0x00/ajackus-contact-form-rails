class ContactsController < ApplicationController

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: t('messages.contact_create_success')  }
        format.json { render json: @contact, status: :created, notice: t('messages.contact_create_success') }
      else
        format.html { render :new, notice:  t('messages.contact_create_fail')}
        format.json { render json: @contact.errors, status: :unprocessable_entity, notice: t('messages.contact_create_fail') }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
    end
end
