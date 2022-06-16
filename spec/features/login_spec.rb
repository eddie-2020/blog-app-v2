require 'rails_helper'

RSpec.describe 'Login Page,' do
  before { visit user_session_path }

  describe 'Integrate to' do
    it 'shows the email input' do
      expect(page).to have_content('Email')
    end

    it 'shows the password input' do
      expect(page).to have_content('Password')
    end

    it 'shows the submit button' do
      expect(page).to have_content('Log in')
    end
  end

  describe 'When the submit button is been clicked it should,' do
    it 'show detailed error if username and password is not filled' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'show detailed error if incorrect data filled in' do
      fill_in 'Email', with: 'oluyaratosin1@gmail.com'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'show detailed error to confirm email if email is not confirmed' do
      fill_in 'Email', with: 'oluyaratosin123@gmail.com'
      fill_in 'Password', with: 'Yara123#@'
      click_button 'Log in'
      expect(page).to have_content('You have to confirm your email address before continuing')
    end

    it 'show success message and redirects to root page if correct data is filled in' do
      # confirm user email
      User.find(1).update(confirmed_at: DateTime.now)

      fill_in 'Email', with: 'oluyaratosin123@gmail.com'
      fill_in 'Password', with: 'Yara123#@'
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully')
      expect(page).to have_current_path '/'
    end
  end
end
