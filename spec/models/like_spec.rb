require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations' do
    subject { Like.new(author_id: 6, post_id: 1) }

    before { subject.save }

    it 'bes an integer of author id' do
      subject.author_id = 'a'
      expect(subject).to_not be_valid
    end

    it 'bes an integer of post id' do
      subject.post_id = 'b'
      expect(subject).to_not be_valid
    end
  end
end
