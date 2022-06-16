require 'rails_helper'

RSpec.describe 'User Index page,' do
  before { visit root_path }

  describe 'Integrate to show' do
    it 'username of all other users' do
      expect(page).to have_content('Edwward')
      expect(page).to have_content('YARA')
    end

    it 'shows profile picture for each user' do
      expect(page).to have_selector('.avatar-image', count: 2)
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Number of posts', count: 1)
    end
  end

  it 'redirects to user\'s show page when clicked on a user' do
    user = User.find(1)
    click_link user.name
    expect(page).to have_current_path(user_path(user.id))
  end
end
