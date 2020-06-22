class ContactsController < ApplicationController
  before_action :set_locale, only: [:new]

  # GET /contacts/new
  def new
    @supported_languages = I18n.available_locales
    @contact = Contact.new
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
        format.json { render :new, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_contact
    #   @contact = Contact.find(params[:id])
    # end

    def set_locale
      query_locale = params[:locale]
      valid_locale = I18n.available_locales.map(&:to_s).include?(query_locale)
      if valid_locale
        I18n.locale = query_locale
      else
        I18n.locale = I18n.default_locale
      end
    end
    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
    end
end
