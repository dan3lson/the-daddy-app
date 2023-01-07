require "rails_helper"

RSpec.describe UserHelper, type: :helper do
  describe "#baby_names" do
    it "should show one baby name" do
      daddy = create(:daddy_with_babies)

      expect(baby_names(daddy)).to eq("Danelson Jr.")
    end

    it "should show two baby names" do
      daddy = create(:daddy_with_babies)
      create(:baby, first_name: "Mariella", daddy: daddy)

      expect(baby_names(daddy)).to eq("Danelson Jr. and Mariella")
    end

    it "should show three baby names" do
      daddy = create(:daddy_with_babies)
      create(:baby, first_name: "Mariella", daddy: daddy)
      create(:baby, first_name: "Dalivia", daddy: daddy)

      expect(baby_names(daddy)).to eq("Danelson Jr., Mariella, and Dalivia")
    end
  end

  describe "#first_initial" do
    it "should show the first letter of a user (uppercase)" do
      daddy = create(:user)

      expect(first_initial(daddy)).to eq("D")
    end

    it "should show the first letter of a user (lowercase)" do
      daddy = create(:user, first_name: "danelson")

      expect(first_initial(daddy)).to eq("D")
    end
  end
end
