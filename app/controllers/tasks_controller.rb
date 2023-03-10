class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order(due_date: :asc)
    @expired_tasks = @tasks.select(&:is_expired)
    @pending_tasks = @tasks.select { |task| task.status == 'pending' }
    @completed_tasks = @tasks.select { |task| task.status == 'completed' }
  end
  

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.status = "pending"

    if @task.save
      respond_to_format(@task, :created)
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @task.update(task_params)
      respond_to_format(@task, :ok)
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @tasks = current_user.tasks.where('title LIKE ?', "%#{params[:search]}%")
    render :index
  end
  

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end

  def respond_to_format(task, status)
    respond_to do |format|
      format.html { redirect_to task, notice: 'Task was successfully created.' }
      format.json { render :show, status: status, location: task }
    end
  end
end