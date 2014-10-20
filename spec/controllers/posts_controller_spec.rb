require 'spec_helper'

describe PostsController do
  describe "GET show" do
    it "sets @post for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      post = Fabricate(:post)
      get :show, id: post.id
      expect(assigns(:post)).to eq(post)
    end

    it "sets @comments for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      post = Fabricate(:post)
      comment1 = Fabricate(:comment, commentable: post)
      comment2 = Fabricate(:comment, commentable: post)
      get :show, id: post.id
      expect(assigns(:comments)).to match_array([comment1, comment2])
    end

    it "redirects unauthenticated users to the sign in page" do
      post = Fabricate(:post)
      get :show, id: post.id
      expect(response).to redirect_to sign_in_path
    end
  end

  # describe "POST search" do
  #   it "sets @results for authenticated users" do
  #     session[:user_id] = Fabricate(:user).id
  #     post1 = Fabricate(:post, title: 'Hello, World!', body: "Hi")
  #     post :search, search_term: 'World'
  #     expect(assigns(:results)).to eq([post1])
  #   end
  #   it "redirects unauthenticated users to sign in page" do
  #     post1 = Fabricate(:post, title: 'Hello, World!', body: "Hi")
  #     post :search, search_term: 'World'
  #     expect(response).to redirect_to sign_in_path
  #   end
  # end

end