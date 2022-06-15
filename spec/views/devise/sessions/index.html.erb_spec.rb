require 'rails_helper'

RSpec.describe 'Devise sessions', type: :system do
  context 'login page' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com',
                          password: 'Yara123#@', password_confirmation: 'Yara123#@')
      @user.confirm

      visit new_user_session_path
    end

    it 'should show username input' do
      expect(page).to have_field('Email')
    end

    it 'should show password input' do
      expect(page).to have_field('Password')
    end

    it 'should throw error when clicking submit button without filling form' do
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should throw error when clicking submit button when filling form with incorrect data' do
      fill_in('Email', with: 'o@gmail.com')
      fill_in('Password', with: 'root17')
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should redirect to root path when data is correct and submit button is clicked' do
      fill_in('Email', with: 'oluyaratosin123@gmail.com')
      fill_in('Password', with: 'Yara123#@')
      click_button('Log in')
      expect(current_path).to eql(root_path)
    end
  end
end
