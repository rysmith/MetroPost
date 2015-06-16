require 'rails_helper'

RSpec.describe 'Login', :type => :feature do
  describe 'loggin a user in' do
    it 'logs in a user and redirects to users path' do
      FactoryGirl.create(:valid_user)

      visit new_session_path

      within('.sign-in-form') do

        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password1'
        click_on 'Login'
        expect(current_path).to eq(comments_path)
      end
    end
  end
end
