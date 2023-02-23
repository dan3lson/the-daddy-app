require "rails_helper"

RSpec.describe Child, type: :model do
  it { should belong_to(:daddy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:gender) }
  it { should define_enum_for(:gender).with_values(%i[male female]) }
  it { should validate_presence_of(:birthdate) }

  describe "#humanize_gender" do
    context "when a daddy has a male child" do
      it "converts the gender to read 'boy'" do
        expect(create(:child).humanize_gender).to eq("boy")
      end
    end

    context "when a daddy has a female child" do
      it "converts the gender to read 'girl'" do
        expect(create(:child, :female).humanize_gender).to eq("girl")
      end
    end
  end
end
