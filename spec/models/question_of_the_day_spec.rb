# frozen_string_literal: true

require "rails_helper"

RSpec.describe QuestionOfTheDay, type: :model do
  describe "associations" do
    it { should have_many(:users_question_of_the_days).dependent(:destroy) }
    it { should have_many(:users) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:day) }
    it { is_expected.to validate_presence_of(:question) }
  end

  describe "class methods" do
    describe ".today" do
      subject(:question_of_the_day) { described_class.today }

      let!(:question) { create(:question_of_the_day) }

      it { is_expected.to eq(question) }
    end
  end
end
