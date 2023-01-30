# frozen_string_literal: true

require "rails_helper"

RSpec.describe Emoji, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:reactions).dependent(:restrict_with_error) }
  end

  describe "validations" do
    subject(:emoji) { create(:emoji) }

    it { is_expected.to validate_presence_of(:emoji) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:emoji).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
