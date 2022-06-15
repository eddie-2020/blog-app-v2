require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users', type: :system do
  context 'show page' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      visit user_path(@user.id)
    end

    it 'should show navbar' do
      expect(page).to have_content('Users Profile')
    end

    it 'should show username of user' do
      expect(page).to have_content('Edward')
    end

    it 'should show image of user' do
      expect(page).to have_css("img[src*='i.pravatar.cc/150?img=12']")
    end

    it 'should show number of posts of user' do
      expect(page).to have_content('Number of posts 0')
    end

    it 'should show user\'s bio' do
      expect(page).to have_content('Bio')
      expect(page).to have_content('Full Stack Developer')
    end
  end

  context 'show page posts interaction' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Pedro Guerreiro', photo: 'https://i.pravatar.cc/150?img=12',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      Post.create(author_id: @user.id, title: 'Should not appear', text: 'Really good')
      Post.create(author_id: @user.id, title: 'Capybara Rules', text: 'Really good')
      Post.create(author_id: @user.id, title: 'RSpec is cool', text: 'Really good')
      Post.create(author_id: @user.id, title: 'Integration test', text: 'Really good')

      visit user_path(@user.id)
    end

    it 'should show user\'s first 3 posts' do
      expect(page).to have_content('Integration test')
      expect(page).to have_content('Capybara Rules')
      expect(page).to have_content('RSpec is cool')
      expect(page).to_not have_content('Should not appear')
    end

    it 'should show button to view all user\'s posts' do
      expect(page).to have_content('See all posts')
    end

    it 'should click link to view all user\'s posts and redirect to user\'s post\'s index page' do
      click_link('See all posts')
      expect(current_path).to eql(user_posts_path(@user.id))
    end

    it 'should click specific post link to view specifi cuser\'s post' do
      post = Post.create(author_id: @user.id, title: 'Capybara Rules', text: 'Really good')

      visit user_path(@user.id)
      click_link(post.title)

      expect(current_path).to eql(user_post_path(@user, post.id))
    end
  end
end
# rubocop:enable Metrics/BlockLength
