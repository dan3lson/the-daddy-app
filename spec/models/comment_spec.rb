require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:topic).optional }
  it { should belong_to(:parent).optional }
  it { should have_many(:replies).dependent(:destroy) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(3) }
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

  describe '#replies?' do
    it 'should not have replies' do
      comment = create(:comment)

      expect(comment).to_not be_replies
    end

    it 'should have replies' do
      comment = create(:comment_with_replies)

      expect(comment).to be_replies
    end
  end

  describe '#root?' do
    context 'when a user writes a root comment w/o replies' do
      it 'shows at the very top of the feed' do
        comment = create(:comment)

        expect(comment).to be_root
      end
    end

    context 'when a user writes a root comment with nested-1 replies' do
      it 'shows at the top of all nested comments' do
        comment = create(:comment_with_replies)
        reply = comment.replies.first

        expect(comment).to be_root
        expect(reply).not_to be_root
      end
    end

    context 'when a user writes a root comment with nested-2 replies' do
      it 'shows at the top of all nested comments' do
        comment = create(:comment_with_replies)
        reply = comment.replies.first
        reply2 = create(:comment, parent: reply)

        expect(comment).to be_root
        expect(reply).not_to be_root
        expect(reply2).not_to be_root
      end
    end
  end

  describe '#reply?' do
    context 'when a user writes a root comment' do
      it 'determines it is not a reply to an existing comment' do
        root_comment = create(:comment)

        expect(root_comment).not_to be_reply
      end
    end

    context 'when a user replies to a root comment' do
      it 'determines the comment is a reply' do
        root_comment = create(:comment_with_replies)
        reply_comment = root_comment.replies.first

        expect(root_comment).not_to be_reply
        expect(reply_comment).to be_reply
      end
    end

    context 'when a user replies to a root comment and has its own replies' do
      it 'determines which comments are replies' do
        root_comment = create(:comment_with_replies)
        reply_comment = root_comment.replies.first
        nested2_comment = create(:comment, parent: reply_comment)

        expect(root_comment).not_to be_reply
        expect(reply_comment).to be_reply
        expect(nested2_comment).to be_reply
      end
    end
  end
end
