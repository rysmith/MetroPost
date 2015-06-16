require 'rails_helper'

RSpec.describe 'New Post', :type => :feature do
  describe 'create a new post' do
    it 'creates a new post and redirects to all posts' do

      FactoryGirl.create(:valid_user)

      visit new_session_path

      within('.sign-in-form') do

        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password1'
        click_on 'Login'
      end

      visit new_comment_path

      fill_in 'Comment title', with: 'test post title'
      fill_in 'Comment text', with: 'test post body'
      click_on 'submit'

      expect(current_path).to eq(comments_path)
    end
  end
end