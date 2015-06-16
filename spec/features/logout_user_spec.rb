require 'rails_helper'

RSpec.describe 'Logout', :type => :feature do
  describe 'log a user out' do

    it 'should log out a user and redirect to sesssion new path' do

      FactoryGirl.create(:valid_user)

      visit new_session_path

      within('.sign-in-form') do

        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password1'
        click_on 'Login'
        expect(current_path).to eq(comments_path)
      end

      visit comments_path

      click_on 'Logout'
      expect(current_path).to eq(new_session_path)
    end
  end
end
