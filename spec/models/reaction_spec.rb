# frozen_string_literal: true

require "rails_helper"

RSpec.describe Reaction, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:emoji) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:reactionable) }
  end

  describe "validations" do
    subject(:reaction) { create(:reaction) }

    it do
      is_expected
        .to validate_uniqueness_of(:user)
        .scoped_to(%i[reactionable_id reactionable_type])
        .with_message("Only one reaction is allowed at this time")
    end
  end

  describe "scopes" do
    subject(:scope) { described_class.public_send(scope_name) }

    describe ".likes" do
      let(:scope_name) { :likes }
      let!(:reaction) { create(:reaction, :like) }

      it { is_expected.to include(reaction) }
      it { expect(scope.count).to eq(1) }

      context "without any likes", :aggregate_failures do
        let!(:reaction) { create(:reaction, :heart) }

        it { is_expected.not_to include(reaction) }
        it { expect(scope.count).to eq(0) }
      end
    end
  end
end
