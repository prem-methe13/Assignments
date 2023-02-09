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
      respond_to do |format|
        format.html { render "new" }
      end
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



  private
  def assignment_params
    params.require(:assignment).permit(:title, :text)
  end
end
