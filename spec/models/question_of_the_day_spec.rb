# frozen_string_literal: true

require "rails_helper"

RSpec.describe QuestionOfTheDay, type: :model do
  describe "associations" do
    it { should have_many(:users_question_of_the_days).dependent(:destroy) }
    it { should have_many(:users) }
  end

  describe "validations" do
    subject(:question_of_the_day) { create(:question_of_the_day) }

    it { is_expected.to validate_presence_of(:day) }
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_uniqueness_of(:day) }
  end

  describe "class methods" do
    describe ".today" do
      subject(:today) { described_class.today }

      let(:question) { create(:question_of_the_day) }

      before { question }

      it { is_expected.to eq(question) }

      context "with no question for a specific day" do
        let(:question) { nil }

        it { is_expected.to be_nil }
      end
    end

    describe ".today?" do
      subject(:question_of_the_day_class) { described_class }

      let(:question) { create(:question_of_the_day) }

      before { question }

      it { is_expected.to be_today }

      context "with no question for a specific day" do
        let(:question) { nil }

        it { is_expected.not_to be_today }
      end
    end
  end
end
