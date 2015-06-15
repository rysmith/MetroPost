require 'rails_helper'

RSpec.describe User, :type => :model do

  context 'email' do

    it 'must be present' do

      expect(FactoryGirl.build(:null_email).save).to be false
    end

    it 'must be a valid' do

      expect(FactoryGirl.build(:valid_user).save).to be true
    end

    it 'must have a @' do

      expect(FactoryGirl.build(:invalid_email_no_at).save).to be false
    end

    it 'must have a top level domain' do

      expect(FactoryGirl.build(:invalid_email_no_TLD).save).to be false
    end

    it 'must not have more than 50 chars' do

      expect(FactoryGirl.build(:email_too_long).save).to be false
    end

    it 'must be unique' do

      expect(FactoryGirl.build(:valid_user).save).to be true
      expect(FactoryGirl.build(:valid_user).save).to be false
    end

    it 'must be unique and not case sensitive' do

      expect(FactoryGirl.build(:valid_user).save).to be true
      expect(FactoryGirl.build(:valid_user_upper).save).to be false
    end
  end

  context 'username' do

    it 'must be valid' do

      expect(FactoryGirl.build(:valid_user).save).to be true
    end

    it 'must be present' do

      expect(FactoryGirl.build(:null_username).save).to be false
    end

    it 'must not have more than 50 chars' do

      expect(FactoryGirl.build(:username_too_long).save).to be false
    end

  end

  context 'password' do

    it 'must be present' do

      expect(FactoryGirl.build(:null_password).save).to be false
    end

    it 'must not have more than 50 chars' do

      expect(FactoryGirl.build(:password_too_long).save).to be false
    end

    it 'must be at least 8 chars' do

      expect(FactoryGirl.build(:password_too_short).save).to be false
    end

    it 'must not have mismatched passwords' do

      expect(FactoryGirl.build(:password_mismatch).save).to be false
    end

    it 'must have matching passwords' do

      expect(FactoryGirl.build(:password_match).save).to be true
    end

    it 'must have one letter and one number' do

      expect(FactoryGirl.build(:insecure_password).save).to be false
    end
  end

end
