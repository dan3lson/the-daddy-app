 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/waitlist_users", type: :request do
  # WaitlistUser. As you add validations to WaitlistUser, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      WaitlistUser.create! valid_attributes
      get waitlist_users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      waitlist_user = WaitlistUser.create! valid_attributes
      get waitlist_user_url(waitlist_user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_waitlist_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      waitlist_user = WaitlistUser.create! valid_attributes
      get edit_waitlist_user_url(waitlist_user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new WaitlistUser" do
        expect {
          post waitlist_users_url, params: { waitlist_user: valid_attributes }
        }.to change(WaitlistUser, :count).by(1)
      end

      it "redirects to the created waitlist_user" do
        post waitlist_users_url, params: { waitlist_user: valid_attributes }
        expect(response).to redirect_to(waitlist_user_url(WaitlistUser.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new WaitlistUser" do
        expect {
          post waitlist_users_url, params: { waitlist_user: invalid_attributes }
        }.to change(WaitlistUser, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post waitlist_users_url, params: { waitlist_user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested waitlist_user" do
        waitlist_user = WaitlistUser.create! valid_attributes
        patch waitlist_user_url(waitlist_user), params: { waitlist_user: new_attributes }
        waitlist_user.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the waitlist_user" do
        waitlist_user = WaitlistUser.create! valid_attributes
        patch waitlist_user_url(waitlist_user), params: { waitlist_user: new_attributes }
        waitlist_user.reload
        expect(response).to redirect_to(waitlist_user_url(waitlist_user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        waitlist_user = WaitlistUser.create! valid_attributes
        patch waitlist_user_url(waitlist_user), params: { waitlist_user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested waitlist_user" do
      waitlist_user = WaitlistUser.create! valid_attributes
      expect {
        delete waitlist_user_url(waitlist_user)
      }.to change(WaitlistUser, :count).by(-1)
    end

    it "redirects to the waitlist_users list" do
      waitlist_user = WaitlistUser.create! valid_attributes
      delete waitlist_user_url(waitlist_user)
      expect(response).to redirect_to(waitlist_users_url)
    end
  end
end
