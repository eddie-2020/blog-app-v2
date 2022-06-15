require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Posts', type: :system do
  context 'show page' do
    before(:each) do
      driven_by(:rack_test)

      @user = User.create(name: 'Edward', photo: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          bio: 'Full Stack Developer',
                          email: 'oluyaratosin123@gmail.com')
      @user.confirm

      @post = Post.create(author_id: @user.id, title: 'Integration test', text: 'Currently writing integration tests')

      @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'Test Comment')

      visit user_post_path(@user.id, @post.id)
    end

    it 'should show post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'should show post\'s author' do
      expect(page).to have_content(@post.author.name)
    end

    it 'should show the number of comments' do
      expect(page).to have_content('Comments 0')
    end

    it 'should show the number of likes' do
      expect(page).to have_content('Likes 0')
    end

    it 'should show the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'should show the username of each commentor' do
      expect(page).to have_content(@comment.author.name)
    end

    it 'should show the text comment each commentor' do
      expect(page).to have_content(@comment.text)
    end
  end
end
# rubocop:enable Metrics/BlockLength
