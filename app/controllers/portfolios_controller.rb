class PortfoliosController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @letters = @user.letters
    @posts = @user.posts
    @comments = @user.comments
  end

end