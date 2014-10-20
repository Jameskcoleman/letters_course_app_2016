class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :vote]
  before_action :require_user
  before_action :require_creator, only: [:edit, :update]

  def index
    @letters = Letter.all.sort_by{|x| x.created_at}.reverse
  end

  def show
    @comments = @letter.comments
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    @letter.creator = current_user
    if @letter.save
      flash[:notice] = "Your letter was created."
      redirect_to letters_path
    else
      flash[:danger] = "There was an error."
      render :new
    end
  end

  def edit
  end

  def update

    if @letter.update(letter_params)
      flash[:notice] = "The letter was updated."
      redirect_to letter_path(@post)
    else
      render :edit
    end
  end

  def search
    @results = Letter.search_by_title(params[:search_term])
  end

  def comment
    @comment = Comment.create(commentable: @letter, creator: current_user, body: params[:body])

    respond_to do |format|
      format.html do
        if @comment.valid?
          flash[:notice] = 'Your comment was created.'
        else
          flash[:error] = 'There was an error.'
        end
        redirect_to :back
      end
      format.js
    end
  end

  private

  def letter_params
    params.require(:letter).permit!
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @letter.creator || current_user.admin?)
  end

end