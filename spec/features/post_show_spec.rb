require 'rails_helper'

RSpec.describe 'User Post show page,' do
  before do
    @user = User.find(1)
    @post = @user.posts[-1]
    visit user_post_path(@user.id, @post.id)
  end

  describe 'renders' do
    it 'post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'who wrote the post' do
      expect(page).to have_content(@post.user.name)
    end

    it 'how many comments it has' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'how many likes it has' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'name of each commentor' do
      commentor = @post.comments[-1].user.name
      expect(page).to have_content(commentor)
    end

    it 'comment of each commentor' do
      commentor_left = @post.comments[-1].text
      expect(page).to have_content(commentor_left)
    end
  end
end
