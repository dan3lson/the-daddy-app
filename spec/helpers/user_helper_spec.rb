require "rails_helper"

RSpec.describe UserHelper, type: :helper do
  describe "#children_names" do
    context "with only one child" do
      it "shows one name" do
        daddy = create(:daddy_with_children)

        expect(children_names(daddy)).to eq("Danelson Jr.")
      end
    end

    context "with two children" do
      it "shows two names" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)

        expect(children_names(daddy)).to eq("Danelson Jr. and Mariella")
      end
    end

    context "with three children" do
      it "shows three names" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)
        create(:child, first_name: "Dalivia", daddy: daddy)

        expect(children_names(daddy)).to eq("Danelson Jr., Mariella, and Dalivia")
      end
    end
  end

  describe "#children_names_with_ages" do
    context "with only one child" do
      it "shows one name and age" do
        daddy = create(:daddy_with_children)

        expect(children_names_with_ages(daddy)).to eq("Danelson Jr. (3 years)")
      end
    end

    context "with two children" do
      it "shows two names" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)

        expect(children_names_with_ages(daddy))
          .to eq("Danelson Jr. (3 years) and Mariella (3 years)")
      end
    end

    context "with three children" do
      it "shows three names" do
        daddy = create(:daddy_with_children)
        create(:child, first_name: "Mariella", daddy: daddy)
        create(:child, first_name: "Dalivia", daddy: daddy)

        expect(children_names_with_ages(daddy))
          .to eq("Danelson Jr. (3 years), Mariella (3 years), and Dalivia (3 years)")
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
