require 'rails_helper'

RSpec.describe 'User Post index page,' do
  before do
    @user = User.find(1)
    visit user_posts_path(@user.id)
  end

  describe 'renders' do
    it 'user\'s profile picture' do
      expect(page).to have_selector('.user-image', count: 1)
    end

    it 'user\'s name' do
      expect(page).to have_content(@user.name)
    end

    it 'number of posts user has written' do
      expect(page).to have_content('Number of posts')
    end

    it 'a post\'s title' do
      post = @user.posts[-1]
      expect(page).to have_content(post.title)
    end

    it 'some of the posts\'s body' do
      post = @user.posts[-1]
      expect(page).to have_content(post.text.slice(0, 200))
    end

    it 'the first comment on a post' do
      expect(page).to have_content('My First Comment')
    end

    it 'how many comments a post has' do
      post = @user.posts[-1]
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end

    it 'how many likes a post has' do
      post = @user.posts[-1]
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'should show section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end
  end

  it 'redirects me to that post\'s show page, when I click on a post' do
    post = @user.posts[-1]
    click_link post.title
    expect(page).to have_current_path(user_post_path(@user.id, post.id))
  end
end
