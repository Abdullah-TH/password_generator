require 'rails_helper'

RSpec.describe Password, type: :model do
  context "creating passwords" do
    let!(:password) { Password.new(
      website: "https://google.com",
      username: "User",
      password: "123456"
    ) }

    it "should create password if valid website url, username and password are provided" do
      expect(password.valid?).to be_truthy
    end

    it "should not create password with empty website" do
      password.website = ""
      expect(password.valid?).to eq(false)
    end

    it "should not create password with empty username" do
      password.username = ""
      expect(password.valid?).to eq(false)
    end


    it "should not create password with empty password" do
      password.password = ""
      expect(password.valid?).to eq(false)
    end

    it "should not create password with incorrect formatted website" do
      password.website = "google"
      expect(password.valid?).to eq(false)
    end

    it "should not create password if website is not unique" do
      password.save
      password_2 = password.dup
      expect(password_2.valid?).to eq(false)
    end

  end
end
