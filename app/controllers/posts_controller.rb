class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_creator, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.sort_by{|x| x.created_at}.reverse
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      flash[:notice] = "There was an error."
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "The post was updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def search
    @results = Post.search_by_title(params[:search_term])
  end

  def vote
    @post = Post.find(params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if !@vote.valid?
          flash[:error] = 'You can only favorite a post once.'
        end
      redirect_to :back
      end
      format.js
      end
  end


private

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @post.creator || current_user.admin?)
  end

end