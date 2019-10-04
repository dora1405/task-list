class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id:task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completed: params[:task][:completed])
    if @task.save
      redirect_to task_path(@task.id)
    else
      render new_task_path
    end
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to root_path
      return
    else

      @task.name = params[:task][:name]
      @task.description = params[:task][:description]
      @task.completed = params[:task][:completed]
    end
    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render new_task_path
      return
    end
  end
  
  def destroy
    choosen_task = Task.find_by(id: params[:id])
    if choosen_task.nil?
      redirect_to tasks_path
      return
    else
      choosen_task.destroy
      redirect_to root_path
      return
    end
  end
  
  def complete
    
  end
end
