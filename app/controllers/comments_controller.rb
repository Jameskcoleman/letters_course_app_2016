class CommentsController < ApplicationController
  before_filter :find_commentable, only: :create

  def create
    @comment = @commentable.comments.create(commentable: @commentable, creator: current_user, body: params.require(:comment).permit![:body])
    respond_to do |format|
      format.html {redirect_to posts_path}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to home_path
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if !@vote.valid?
          flash[:error] = 'You can only favorite a comment once.'
        end
      redirect_to :back
      end
      format.js
      end
  end

  private

  def find_commentable
    klass = params[:commentable_type].capitalize.constantize
    @commentable = klass.find(params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit!
  end
end