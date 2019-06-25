class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  # SHOW
  def show
    @task = Task.find(params[:id])
  end

  # CREATE
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_url(@tasks)
  end

  # EDIT
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_url(@tasks)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url(@tasks)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
