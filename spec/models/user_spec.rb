require 'rails_helper'

RSpec.describe User, :type => :model do

  context "email" do

    it "must be present" do

      expect(FactoryGirl.build(:null_email).save).to be false
    end

    it "must be a valid" do

      expect(FactoryGirl.build(:valid_user).save).to be true
    end

    it "must not be invalid" do

      expect(FactoryGirl.build(:invalid_email).save).to be false
    end

    it "must not have more than 50 chars" do

      expect(FactoryGirl.build(:email_too_long).save).to be false
    end

    it "must be unique" do

      expect(FactoryGirl.build(:valid_user).save).to be true
      expect(FactoryGirl.build(:valid_user).save).to be false
    end
  end

  context "username" do

    it "must be valid" do

      expect(FactoryGirl.build(:valid_user).save).to be true
    end

    it "must be present" do

      expect(FactoryGirl.build(:null_username).save).to be false
    end

    it "must not have more than 50 chars" do

      expect(FactoryGirl.build(:username_too_long).save).to be false
    end

  end

  context "password" do

    it "must be present" do

      expect(FactoryGirl.build(:null_password).save).to be false
    end

    it "must not have more than 50 chars" do

      expect(FactoryGirl.build(:password_too_long).save).to be false
    end
  end

end
