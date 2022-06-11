require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    user = User.create(name: 'edward', bio: 'full stack developer from Nigeria.', posts_counter: 0)
    subject do
      Post.new(title: 'first post by edward', text: 'my best blog post', author: user, comments_counter: 2,
               likes_counter: 2)
    end

    before { subject.save }

    it 'should have attribute title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not be greater than 250 characters' do
      subject.title = 'Hello'
      expect(subject).to be_valid
    end

    it 'should be an integer of comments counter' do
      subject.comments_counter = 2
      expect(subject).to be_valid
    end

    it 'should have comments counter greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have likes counter greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes should be an integer' do
      subject.likes_counter = 2.2
      expect(subject).to_not be_valid
    end

    describe 'should test post model' do
      it 'should render recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.last(5))
      end
    end
  end
end
