class LettersController < ApplicationController
  before_action :set_assignment_and_letter, only: [:edit, :update, :destroy]
  before_action :require_user
  before_action :require_creator, only: [:edit, :update]

  def index
    @assignment = Assignment.find(params[:assignment_id])
    @letters = @assignment.letters
  end

  def show
    @assignment = Assignment.find(params[:assignment_id])
    @letter = @assignment.letters.find(params[:id])
    @comments = @letter.comments
    @comment = Comment.new
  end

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @letter = @assignment.letters.new
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @letter = @assignment.letters.new(letter_params)
    @letter.creator = current_user
    if @letter.save
      flash[:notice] = "Your letter was created."
      redirect_to home_path
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
      redirect_to assignment_letter_path(@assignment, @letter)
    else
      render :edit
    end
  end

  def destroy
    @letter.destroy
    redirect_to assignments_path
  end

  def search
    @results = Letter.search_by_title(params[:search_term])
  end


private

  def set_assignment_and_letter
    @assignment = Assignment.find(params[:assignment_id])
    @letter = @assignment.letters.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit!
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @letter.creator || current_user.admin?)
  end

end