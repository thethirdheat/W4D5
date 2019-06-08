class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end

  def new
    @goal = Goal.new
  end

  def index
    
  end

  def destroy

  end

  def show
    Goal.find_by(id: params[:id])
  end 

  def edit
    @goal = Goal.find_by(id: params[:id])
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal
      if @goal.update_attributes(goal_params)
        redirect_to goal_url(@goal)
      else
        flash.now[:errors] = @goal.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["Goal does not exists!"]
      render :index 
    end
  end


  private
  def goal_params
    params.require(:goal).permit(:body, :title)
  end
end
