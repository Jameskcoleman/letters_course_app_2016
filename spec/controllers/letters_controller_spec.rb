require 'spec_helper'

describe LettersController do
  describe "GET show" do
    it "sets @letter for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      letter = Fabricate(:letter)
      get :show, id: letter.id
      expect(assigns(:letter)).to eq(letter)
    end

    it "sets @comments for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      letter = Fabricate(:letter)
      comment1 = Fabricate(:comment, commentable: letter)
      comment2 = Fabricate(:comment, commentable: letter)
      get :show, id: letter.id
      expect(assigns(:comments)).to match_array([comment1, comment2])
    end

    it "redirects unauthenticated users to the sign in page" do
      letter = Fabricate(:letter)
      get :show, id: letter.id
      expect(response).to redirect_to sign_in_path
    end
  end
end