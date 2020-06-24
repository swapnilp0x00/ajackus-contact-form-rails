require 'rails_helper'

RSpec.describe "Contacts", type: :request do

    context "GET Requests" do
        it "GET / => Should render new Form on root" do
            get "/"
            expect(response).to render_template(:new)    
        end
    
        it "GET /comtacts => Should render new Form on /contacts" do
            get "/contacts"
            expect(response).to render_template(:new)    
        end
    
        it "GET /contacts => Should render new Form in English" do
            get "/contacts?locale=en"
            expect(I18n.locale).to eq(:en)    
        end
    
        it "GET /contacts => Should render new Form in German" do
            get "/contacts?locale=de"
            expect(I18n.locale).to eq(:de)    
        end
    end

    context "GET Requests when locale = en" do
        before(:each) do
            I18n.locale = :en
        end
    
        it "GET /contacts => Should have default locale if query parameter is not given" do
            get "/contacts"
            expect(I18n.locale).to eq(I18n.default_locale)
        end
        it "GET /contacts => Should render new Form in German" do
            get "/contacts?locale=de"
            expect(I18n.locale).to eq(:de)    
        end
    end

    context "GET Requests when locale = de" do
        before(:each) do
            I18n.locale = :de
        end
    
        it "GET /contacts => Should have default locale if query parameter is not given" do
            get "/contacts"
            expect(I18n.locale).to eq(I18n.default_locale)
        end
        it "GET /contacts => Should render new Form in English" do
            get "/contacts?locale=en"
            expect(I18n.locale).to eq(:en)    
        end
    end

    context "Post" do
        it "POST /contacts => Should redirect to /contacts on success" do
            post "/contacts", params: { contact: { 
                first_name: 'Swapnil',
                last_name: 'Pardeshi',
                email: 'swapnilpaaaaa133@gmail.com',
                message: 'hello i am Swapnil'}
            }
            expect(response).to redirect_to(contacts_path)
        end
    
        it "POST /contacts => Should have status code 302" do
            post "/contacts", params: { contact: { 
                first_name: 'Swapnil',
                last_name: 'Pardeshi',
                email: 'swapnilpaaaaa133@gmail.com',
                message: 'hello i am Swapnil'}
            }
            expect(response).to have_http_status("302")
        end
    
        it "POST /contacts.json => Should have status code 302" do
            post "/contacts.json", params: { contact: { 
                first_name: 'Swapnil',
                last_name: 'Pardeshi',
                email: 'swapnilpaaaaa133@gmail.com',
                message: 'hello i am Swapnil'}
            }
            expect(response).to have_http_status(:created)
        end
    
        it "POST /contacts => When data is invalid" do
            post "/contacts", params: { contact: { 
                first_name: 'Swapnil',
                last_name: 'Pardeshi',
                message: 'hello i am Swapnil'}
            }
            expect(response).to render_template(:new)    
        end
    
        it "POST /contacts.json => When invalid data" do
            post "/contacts.json", params: { contact: { 
                first_name: 'Swapnil',
                last_name: 'Pardeshi',
                message: 'hello i am Swapnil'}
            }
            expect(response).to have_http_status(:unprocessable_entity)    
        end
    end
end
