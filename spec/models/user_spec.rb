# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:children).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:feedbacks).dependent(:destroy) }
    it { should have_many(:flags).dependent(:destroy) }
    it { should have_many(:invites).dependent(:destroy) }
    it { should have_many(:reactions).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:upvotes).dependent(:destroy) }
    it { should have_many(:users_question_of_the_days).dependent(:destroy) }
    it { should have_many(:question_of_the_days) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    subject { FactoryBot.create(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
  end

  describe "#children_names" do
    context "when a daddy has one child" do
      it "shows one name" do
        daddy = create(:daddy_with_children)

        expect(daddy.children_names).to eq("Danelson Jr.")
      end
    end

    context "when a daddy has two children" do
      it "shows two names joined by an 'and'" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)

        expect(daddy.children_names).to eq("Danelson Jr. and Mariella")
      end
    end

    context "when a daddy has three or more children" do
      it "shows names separated by a comma" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)
        create(:child, first_name: "Dalivia", daddy: daddy)

        expect(daddy.children_names).to eq("Danelson Jr., Mariella, and Dalivia")
      end
    end
  end

  describe "#liked_comment?" do
    subject(:user) { create(:user, :with_liked_comment) }

    it { is_expected.to be_liked_comment(Comment.first) }

    context "with a comment not liked" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_liked_comment(create(:comment)) }
    end

    context "with a comment liked by another user" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_liked_comment(create(:reaction).reactionable) }
    end
  end

  describe "#question_of_the_day_response?" do
    subject(:user) { create(:user, :with_qotd_response) }

    it { is_expected.to be_question_of_the_day_response(Comment.first) }

    context "with a general comment" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_question_of_the_day_response(create(:comment)) }
    end

    context "with a QOTD response by another user" do
      subject(:user) { create(:user) }

      it do
        is_expected
          .not_to be_question_of_the_day_response(
            create(:users_question_of_the_day)
              .comments
              .first
          )
      end
    end
  end

  describe "#upvoted_feedback?" do
    subject(:user) { create(:user, :with_upvoted_feedback) }

    it { is_expected.to be_upvoted_feedback(Feedback.first) }

    context "with a feedback not upvoted" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_upvoted_feedback(create(:feedback)) }
    end

    context "with a feedback upvoted by another user" do
      subject(:user) { create(:user) }

      it do
        is_expected
          .not_to be_upvoted_feedback(
            create(:reaction, :for_feedback).reactionable
          )
      end
    end
  end

  describe "#flagged_comment?" do
    subject(:user) { create(:user, :with_flagged_comment) }

    it { is_expected.to be_flagged_comment(Comment.first) }

    context "with a comment not flagged" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_flagged_comment(create(:comment)) }
    end

    context "with a comment flagged by another user" do
      subject(:user) { create(:user) }

      it { is_expected.not_to be_flagged_comment(create(:comment_with_flags)) }
    end
  end
end
