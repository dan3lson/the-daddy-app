# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flag, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:comment) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    subject(:flag) { create(:flag) }

    it do
      is_expected
        .to validate_uniqueness_of(:comment)
        .scoped_to(%i[user_id])
        .with_message("User can only flag a comment once")
    end
  end
end
