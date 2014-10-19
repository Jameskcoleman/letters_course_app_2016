require 'spec_helper'

describe UsersController do
  # describe "GET new" do
  #   expect(assigns(:user)).to be_instance_of(User)
  # end

  describe "POST create" do
    context "successful user signup" do
      it "redirects to the sign in page" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end