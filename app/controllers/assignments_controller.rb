class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all.sort_by{|x| x.created_at}.reverse
  end

  def show
    @assignment = Assignment.find(params[:id])
    @letters = @assignment.letters.order(created_at: :desc)
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      flash[:notice] = "The assignment was created."
      redirect_to assignments_path
    else
      flash[:danger] = "There was an error."
      render :new
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:notice] = "The assignment was updated."
      redirect_to assignments_path(@assignment)
    else
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to assignments_path
  end

private

  def assignment_params
    params.require(:assignment).permit!
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end