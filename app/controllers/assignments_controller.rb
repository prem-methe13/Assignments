class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to @assignment
    else
      render 'new'
    end
  end

  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update(assignment_params)
      redirect_to @assignment
    else
      render 'edit'
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment.delete
      flash[:notice] = 'Assignment deleted!'
      redirect_to assignments_path
    else
      flash[:error] = 'Failed to delete assignment!'
      render :destroy
    end
  end

  private
  def assignment_params
    params.require(:assignment).permit(:title, :text)
  end
end
