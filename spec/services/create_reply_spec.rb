require "rails_helper"

RSpec.describe CreateReply do
  describe "#post" do
    describe "when a daddy posts an invalid reply (missing body data)" do
      it "prevents the post" do
        comment = create(:comment)
        user = comment.user
        attrs = {body: "", parent_id: comment.id}
        replier = create(:user)

        CreateReply.new(replier, attrs).post

        expect(Comment.count).to eq(1)
        expect(replier.comments.count).to eq(0)
        expect(user.comments.count).to eq(1)
      end
    end

    describe "when a daddy successfully responds to an existing comment" do
      it "creates the post" do
        comment = create(:comment)
        user = comment.user
        attrs = {body: "Oh yeah, my little one, too!", parent_id: comment.id}
        replier = create(:user)

        CreateReply.new(replier, attrs).post

        expect(Comment.count).to eq(2)
        expect(replier.comments.count).to eq(1)
        expect(user.comments.count).to eq(1)
      end
    end
  end
end
