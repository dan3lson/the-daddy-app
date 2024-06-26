# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:flags).dependent(:destroy) }
    it { is_expected.to belong_to(:parent).optional }
    it { is_expected.to have_many(:reactions).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to belong_to(:topic).optional }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:users_question_of_the_day).optional }
  end

  describe "validations" do
    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(2) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to define_enum_for(:status).with_values(%i[active inactive]) }
    xit do
      is_expected.to validate_content_type_of(:image)
        .allowing("image/png", "jpg", "jpeg", "image/jpeg", "image/gif")
    end
    xit { is_expected.to validate_size_of(:image).less_than_or_equal_to(4.megabytes) }
  end

  describe "#liked?" do
    subject(:comment) { create(:comment_with_likes) }

    it { is_expected.to be_liked }

    context "without any likes" do
      subject(:comment) { create(:comment) }

      it { is_expected.not_to be_liked }
    end
  end

  describe ".root" do
    it "should be empty" do
      comment = create(:comment)

      expect(Comment.root).to include(comment)
    end

    it "should not be empty" do
      comment = create(:comment_with_replies, replies_count: 1)

      expect(comment.replies.size).to eq(1)
    end

    it "should have 21 replies" do
      comment = create(:comment_with_replies, replies_count: 21)

      expect(comment.replies.size).to eq(21)
    end
  end

  describe "#replies?" do
    it "should not have replies" do
      comment = create(:comment)

      expect(comment).to_not be_replies
    end

    it "should have replies" do
      comment = create(:comment_with_replies)

      expect(comment).to be_replies
    end
  end

  describe "#root?" do
    context "when a user writes a root comment w/o replies" do
      it "shows at the very top of the feed" do
        comment = create(:comment)

        expect(comment).to be_root
      end
    end

    context "when a user writes a root comment with nested-1 replies", :aggregate_failures do
      it "shows at the top of all nested comments" do
        comment = create(:comment_with_replies)
        reply = comment.replies.first

        expect(comment).to be_root
        expect(reply).not_to be_root
      end
    end

    context "when a user writes a root comment with nested-2 replies", :aggregate_failures do
      it "shows at the top of all nested comments" do
        comment = create(:comment_with_replies)
        reply = comment.replies.first
        reply2 = create(:comment, parent: reply)

        expect(comment).to be_root
        expect(reply).not_to be_root
        expect(reply2).not_to be_root
      end
    end
  end

  describe "#reply?" do
    context "when a user writes a root comment" do
      it "determines it is not a reply to an existing comment" do
        root_comment = create(:comment)

        expect(root_comment).not_to be_reply
      end
    end

    context "when a user replies to a root comment", :aggregate_failures do
      it "determines the comment is a reply" do
        root_comment = create(:comment_with_replies)
        reply_comment = root_comment.replies.first

        expect(root_comment).not_to be_reply
        expect(reply_comment).to be_reply
      end
    end

    context "when a user replies to a root comment and has its own replies", :aggregate_failures do
      it "determines which comments are replies" do
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
