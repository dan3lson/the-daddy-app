# frozen_string_literal: true

require "rails_helper"

RSpec.describe Child, type: :model do
  it { should belong_to(:daddy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:gender) }
  it { should define_enum_for(:gender).with_values(%i[male female]) }
  it { should validate_presence_of(:birthdate) }

  describe "methods" do
    describe "#age" do
      subject(:age) { child.age }

      let(:child) { create(:child, birthdate: birthdate) }
      let(:birthdate) { "May 16, 2022" }

      before { travel_to time }

      context "when not born yet" do
        let(:time) { Time.parse("2022, May 15") }

        it { is_expected.to eq("0 days") }
      end

      context "when 1 day old" do
        let(:time) { Time.parse("2022, May 17") }

        it { is_expected.to eq("1 day") }
      end

      context "when 2 days old" do
        let(:time) { Time.parse("2022, May 18") }

        it { is_expected.to eq("2 days") }
      end

      context "when 1 week old" do
        let(:time) { Time.parse("2022, May 23") }

        it { is_expected.to eq("1 week") }
      end

      context "when 2 weeks old" do
        let(:time) { Time.parse("2022, May 30") }

        it { is_expected.to eq("2 weeks") }
      end

      context "when 1 month old" do
        let(:time) { Time.parse("2022, June 16") }

        it { is_expected.to eq("1 month") }
      end

      context "when 2 months old" do
        let(:time) { Time.parse("2022, July 16") }

        it { is_expected.to eq("2 months") }
      end

      context "when 1 year old" do
        let(:time) { Time.parse("2023, May 16") }

        it { is_expected.to eq("1 year") }
      end

      context "when 2 years old" do
        let(:time) { Time.parse("2024, May 16") }

        it { is_expected.to eq("2 years") }
      end
    end

    describe "#age_in_days" do
      subject(:age) { child.age_in_days }

      let(:child) { create(:child, birthdate: birthdate) }
      let(:birthdate) { "May 16, 2022" }

      before { travel_to time }

      context "when not born yet" do
        let(:time) { Time.parse("2022, May 15") }

        it { is_expected.to eq(0) }
      end

      context "when 1 day old" do
        let(:time) { Time.parse("2022, May 17") }

        it { is_expected.to eq(1) }
      end

      context "when 2 days old" do
        let(:time) { Time.parse("2022, May 18") }

        it { is_expected.to eq(2) }
      end

      context "when 3 days old" do
        let(:time) { Time.parse("2022, May 19") }

        it { is_expected.to eq(3) }
      end

      context "when 4 days old" do
        let(:time) { Time.parse("2022, May 20") }

        it { is_expected.to eq(4) }
      end

      context "when 5 days old" do
        let(:time) { Time.parse("2022, May 21") }

        it { is_expected.to eq(5) }
      end

      context "when 6 days old" do
        let(:time) { Time.parse("2022, May 22") }

        it { is_expected.to eq(6) }
      end

      context "when 7 days old" do
        let(:time) { Time.parse("2022, May 23") }

        it { is_expected.to eq(7) }
      end

      context "when 8 days old" do
        let(:time) { Time.parse("2022, May 24") }

        it { is_expected.to eq(8) }
      end

      context "when 100 days old" do
        let(:time) { Time.parse("2022, August 24") }

        it { is_expected.to eq(100) }
      end
    end

    describe "#age_in_weeks" do
      subject(:age) { child.age_in_weeks }

      let(:child) { create(:child, birthdate: birthdate) }
      let(:birthdate) { "May 16, 2022" }

      before { travel_to time }

      context "when only days old" do
        let(:time) { Time.parse("2022, May 22") }

        it { is_expected.to eq(0) }
      end

      context "when 1 week old" do
        let(:time) { Time.parse("2022, May 23") }

        it { is_expected.to eq(1) }
      end

      context "when 2 weeks old" do
        let(:time) { Time.parse("2022, May 30") }

        it { is_expected.to eq(2) }
      end

      context "when 3 weeks old" do
        let(:time) { Time.parse("2022, June 06") }

        it { is_expected.to eq(3) }
      end

      context "when 4 weeks old" do
        let(:time) { Time.parse("2022, June 13") }

        it { is_expected.to eq(4) }
      end

      context "when 5 weeks old" do
        let(:time) { Time.parse("2022, June 20") }

        it { is_expected.to eq(5) }
      end

      context "when 6 weeks old" do
        let(:time) { Time.parse("2022, June 27") }

        it { is_expected.to eq(6) }
      end

      context "when 100 weeks old" do
        let(:time) { Time.parse("2024, April 15") }

        it { is_expected.to eq(100) }
      end
    end

    describe "#age_in_months" do
      subject(:age) { child.age_in_months }

      let(:child) { create(:child, birthdate: birthdate) }
      let(:birthdate) { "May 16, 2022" }

      before { travel_to time }

      context "when weeks old" do
        let(:time) { Time.parse("2022, May 17") }

        it { is_expected.to eq(0) }
      end

      context "when 1 month old" do
        let(:time) { Time.parse("2022, June 16") }

        it { is_expected.to eq(1) }
      end

      context "when 2 months old" do
        let(:time) { Time.parse("2022, July 16") }

        it { is_expected.to eq(2) }
      end

      context "when 3 months old" do
        let(:time) { Time.parse("2022, August 16") }

        it { is_expected.to eq(3) }
      end

      context "when 4 months old" do
        let(:time) { Time.parse("2022, September 16") }

        it { is_expected.to eq(4) }
      end

      context "when 5 months old" do
        let(:time) { Time.parse("2022, October 16") }

        it { is_expected.to eq(5) }
      end

      context "when 6 months old" do
        let(:time) { Time.parse("2022, November 16") }

        it { is_expected.to eq(6) }
      end

      context "when 7 months old" do
        let(:time) { Time.parse("2022, December 16") }

        it { is_expected.to eq(7) }
      end

      context "when 8 months old" do
        let(:time) { Time.parse("2023, January 16") }

        it { is_expected.to eq(8) }
      end

      context "when 9 months old" do
        let(:time) { Time.parse("2023, February 16") }

        it { is_expected.to eq(9) }
      end

      context "when 10 months old" do
        let(:time) { Time.parse("2023, March 16") }

        it { is_expected.to eq(10) }
      end

      context "when 11 months old" do
        let(:time) { Time.parse("2023, April 16") }

        it { is_expected.to eq(11) }
      end

      context "when 12 months old" do
        let(:time) { Time.parse("2023, May 16") }

        it { is_expected.to eq(12) }
      end

      context "when 100 months old" do
        let(:time) { Time.parse("2030, September 16") }

        it { is_expected.to eq(100) }
      end
    end

    describe "#age_in_years" do
      subject(:age) { child.age_in_years }

      let(:child) { create(:child, birthdate: birthdate) }
      let(:birthdate) { "May 16, 2022" }

      before { travel_to time }

      context "when not a year yet" do
        let(:time) { Time.parse("2023, May 15") }

        it { is_expected.to eq(0) }
      end

      context "when 1 year old" do
        let(:time) { Time.parse("2023, May 16") }

        it { is_expected.to eq(1) }
      end

      context "when 2 years old" do
        let(:time) { Time.parse("2024, May 16") }

        it { is_expected.to eq(2) }
      end

      context "when 3 years old" do
        let(:time) { Time.parse("2025, May 16") }

        it { is_expected.to eq(3) }
      end

      context "when 5 years old" do
        let(:time) { Time.parse("2027, May 16") }

        it { is_expected.to eq(5) }
      end

      context "when 10 years old" do
        let(:time) { Time.parse("2032, May 16") }

        it { is_expected.to eq(10) }
      end

      context "when 21 years old" do
        let(:time) { Time.parse("2043, May 16") }

        it { is_expected.to eq(21) }
      end

      context "when 30 years old" do
        let(:time) { Time.parse("2052, December 16") }

        it { is_expected.to eq(30) }
      end
    end
  end
end
