require 'rails_helper'

RSpec.describe 'post', type: :system do
  context 'index page' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyartosin123@gmail.com')
      @user.confirm

      visit user_posts_path(@user.id)
    end

    it "should show the user's profile picture." do
      expect(page).to have_css("img[src*='media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif']")
    end

    it "should show the user's username." do
      expect(page).to have_content('Edward')
    end
  end

  context 'index page with post' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      @post = Post.create(author_id: @user.id, title: 'Integration test', text: 'Feels good writing tests')
      Comment.create(author_id: @user.id, post_id: @post.id, text: 'Test Comment')
      Like.create(author_id: @user.id, post_id: @post.id)

      visit user_posts_path(@user.id)
    end

    it 'should show the number of posts the user has written.' do
      expect(page).to have_content('All Posts')
    end

    it "should show a post's title." do
      expect(page).to have_content('Integration test')
    end

    it "should show the post's body." do
      expect(page).to have_content('Feels good writing tests')
    end

    it 'should show the first comments on a post.' do
      expect(page).to have_content('Test Comment')
    end

    it 'should show how many comments a post has.' do
      expect(page).to have_content('Comments 0')
    end

    it 'should show how many likes a post has.' do
      expect(page).to have_content('Likes 0')
    end
  end

  context 'index page post redirect and pagination' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      @post = Post.create(author_id: @user.id, title: 'Integration test', text: 'Feels good writing tests')

      visit user_posts_path(@user.id)
    end
    it 'should show section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end

    it "should redirect to the post's show page when I click on a post" do
      click_link(@post.title)
      expect(current_path).to eql(user_post_path(@user.id, @post.id))
    end
  end
end
