require 'rails_helper'

RSpec.describe Password, type: :model do
  context "creating passwords" do
    let(:password) { create(:password) }

    it "is valid with website url, username and password are provided" do
      expect(password).to be_valid
    end

    it "is not valid with empty website" do
      password.website = ""
      expect(password).not_to be_valid
    end

    it "is not valid with empty username" do
      password.username = ""
      expect(password).not_to be_valid
    end


    it "is not valid with empty password" do
      password.password = ""
      expect(password).not_to be_valid
    end

    it "is not valid with incorrectly formatted website" do
      password.website = "google"
      expect(password).not_to be_valid

      password.website = "google.com"
      expect(password).to be_valid

      password.website = "google.io"
      expect(password).to be_valid

      password.website = "www.google.com"
      expect(password).to be_valid
    end

    it "is not valid with a non-unique website" do
      password_2 = password.dup
      expect(password_2.valid?).to eq(false)
    end

  end
end
