# frozen_string_literal: true

require "rails_helper"

RSpec.describe Registration do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:children) }

  describe "#register" do
    describe "when a daddy unsuccessfully registers (missing daddy data)" do
      it "prevents registration" do
        attrs = attributes_for(:invalid_daddy_registration)

        Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Child.count).to eq(0)
      end
    end

    describe "when a daddy fails registration (missing child data)" do
      it "prevents registration" do
        attrs = attributes_for(:invalid_child_registration)

        Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Child.count).to eq(0)
      end
    end

    describe "when a daddy successfully registers with one child" do
      it "creates a new user and one child record" do
        attrs = attributes_for(:registration).stringify_keys

        Registration.new(attrs).register

        danelson = User.find_by(first_name: attrs["first_name"])
        child = danelson.children.find_by(
          first_name: attrs["children"]["0"]["first_name"]
        )

        expect(User.count).to eq(1)
        expect(Child.count).to eq(1)
        expect(danelson.children.count).to eq(1)
        expect(child.first_name).to eq("Junior")
        expect(child.daddy).to eq(danelson)
      end
    end

    describe "when a daddy successfully registers with two children" do
      it "creates a new user and one child record" do
        attrs = attributes_for(:registration, :multiple_children).stringify_keys

        Registration.new(attrs).register

        danelson = User.find_by(first_name: attrs["first_name"])
        child1 = danelson.children.find_by(
          first_name: attrs["children"]["0"]["first_name"]
        )
        child2 = danelson.children.find_by(
          first_name: attrs["children"]["1"]["first_name"]
        )

        expect(User.count).to eq(1)
        expect(Child.count).to eq(2)
        expect(danelson.children.count).to eq(2)
        expect(child1.first_name).to eq("Junior")
        expect(child1.daddy).to eq(danelson)
        expect(child2.first_name).to eq("Mariella")
        expect(child2.daddy).to eq(danelson)
      end
    end
  end
end
