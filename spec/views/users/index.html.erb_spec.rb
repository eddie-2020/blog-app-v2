require 'rails_helper'

RSpec.describe 'Users', type: :system do
  context 'index page' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      visit users_path
    end

    it 'should show welcoming message' do
      expect(page).to have_content('Welcome to my Blog App')
    end

    it 'should show username of user/users' do
      expect(page).to have_content('Edward')
    end

    it 'should show image of user/users' do
      expect(page).to have_css("img[src*='media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif']")
    end

    it 'should show number of posts of user/users' do
      expect(page).to have_content('Number of posts 0')
    end

    it 'should click open profile button and redirect to that user\'s show page' do
      click_link('View Profile')
      expect(current_path).to eql(user_path(@user.id))
    end
  end
end
