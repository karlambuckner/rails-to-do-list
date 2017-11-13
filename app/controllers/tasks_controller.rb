class TasksController < ApplicationController

  def new
   @list = List.find(params[:list_id])
   @task = @list.tasks.new
 end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(list_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private
  def list_params
    params.require(:task).permit(:description)
  end
end
