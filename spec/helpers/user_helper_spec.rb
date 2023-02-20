require "rails_helper"

RSpec.describe UserHelper, type: :helper do
  describe "#children_names" do
    context "with only one child" do
      it "shows one name" do
        daddy = create(:daddy_with_babies)

        expect(children_names(daddy)).to eq("Danelson Jr.")
      end
    end

    context "with two children" do
      it "shows two names" do
        daddy = create(:daddy_with_babies)
        create(:baby, first_name: "Mariella", daddy: daddy)

        expect(children_names(daddy)).to eq("Danelson Jr. and Mariella")
      end
    end

    context "with three children" do
      it "shows three names" do
        daddy = create(:daddy_with_babies)
        create(:baby, first_name: "Mariella", daddy: daddy)
        create(:baby, first_name: "Dalivia", daddy: daddy)

        expect(children_names(daddy)).to eq("Danelson Jr., Mariella, and Dalivia")
      end
    end
  end

  describe "#first_initial" do
    it "shows the first letter of a user (uppercase)" do
      daddy = create(:user)

      expect(first_initial(daddy)).to eq("D")
    end

    it "shows the first letter of a user (lowercase)" do
      daddy = create(:user, first_name: "danelson")

      expect(first_initial(daddy)).to eq("D")
    end
  end
end
