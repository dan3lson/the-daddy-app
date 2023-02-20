# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feedback, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:reactions).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_length_of(:body).is_at_least(3) }
    it do
      is_expected
        .to define_enum_for(:kind)
        .with_values(bug: "bug", feature_request: "feature_request")
        .backed_by_column_of_type(:string)
    end
  end
end
