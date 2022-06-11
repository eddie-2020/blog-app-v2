require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    subject { Comment.new(text: 'This is test my case', author_id: 5, post_id: 3) }

    before { subject.save }

    it 'should not be valid' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'should have author id number' do
      subject.author_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'should have post id number' do
      subject.post_id = 'look'
      expect(subject).to_not be_valid
    end
  end
end
