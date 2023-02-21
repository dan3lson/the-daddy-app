# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersQuestionOfTheDay, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:question_of_the_day) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
