require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "Creating contact" do
    
    let(:contact) {Contact.new(
      first_name: 'swapnil',
      last_name: 'Pardeshi',
      phone: '9028027761',
      email: 'swapnilp133@gmail.com',
      message: 'Hello My name is Swapmnil')}
    
    # Positive Cases
    it "creates contact when all parameters are valid" do
      expect{contact.save}.to change{Contact.count}.by(1)
    end

    # Negative Cases
    # First name
    it "When first_name is missing" do
      contact.first_name = nil
      expect{contact.save}.to change{Contact.count}.by(0)
    end
    it "When first_name exceeds limit 30" do
      contact.first_name = 'S'*31      
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    # Last name
    it "When last_name is missing" do
      contact.last_name = nil
      expect{contact.save}.to change{Contact.count}.by(0)
    end
    it "When last_name exceeds limit 30" do
      contact.last_name = 'P'*31
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    # Phone
    it "When phone is missing" do
      contact.phone = nil
      expect{contact.save}.to change{Contact.count}.by(1)
    end

    it "When phone is not numeric" do
      contact.phone = 'FakePhoneNumber'
      expect{contact.save}.to change{Contact.count}.by(0)
    end
    it "When phone is less than 10 digits" do
      contact.phone = '123'
      expect{contact.save}.to change{Contact.count}.by(0)
    end
    it "When phone is more than 15 digits" do
      contact.phone = '1' * 16
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    # Email
    it "When email is missing" do
      contact.email = nil
      expect{contact.save}.to change{Contact.count}.by(0)
    end
    it "When email is not valid" do
      contact.email = 'swapnil'
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    # Message
    it "When message is missing" do
      contact.message = nil
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    it "When message is less than 10 characters" do
      contact.message = 'Hello'
      expect{contact.save}.to change{Contact.count}.by(0)
    end

    it "When message is more than 500 characters" do
      contact.message = 'H'*501
      expect{contact.save}.to change{Contact.count}.by(0)
    end
  end
end
