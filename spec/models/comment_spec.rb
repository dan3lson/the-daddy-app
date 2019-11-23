require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
  it { should belong_to(:parent).optional }
  it { should have_many(:replies).dependent(:destroy) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:status) }
  it { should define_enum_for(:status).with_values(%i[active inactive]) }

  describe '.root' do
    it 'should be empty' do
      comment = create(:comment)
      expect(Comment.root).to include(comment)
    end

    it 'should not be empty' do
      comment = create(:comment_with_replies, replies_count: 1)
      expect(comment.replies.size).to eq(1)
      end

    it 'should have 21 replies' do
      comment = create(:comment_with_replies, replies_count: 21)
      expect(comment.replies.size).to eq(21)
    end
  end

  describe '#reply?' do
    it 'should not have a parent' do
      comment = create(:comment)
      expect(comment).to_not be_reply
    end

    it 'should have a parent' do
      comment = create(:comment_with_replies).replies.first
      expect(comment).to be_reply
    end
  end
end
