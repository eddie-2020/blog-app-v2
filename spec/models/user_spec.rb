require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    subject do
      User.new(name: 'edward', bio: 'full stack developer')
    end

    before { subject.save }

    it 'haves name attributes present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'haves bio attributes present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'user should have post greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'user should have post greater than or equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe 'should test recent post method' do
    before { 4.times { |post| Post.create(author: subject, title: "This is post #{post}") } }

    it 'user should have three recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
