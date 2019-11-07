class TasksController < ApplicationController
  def index

  end

  def show

  end

  def create

    @task = Task.new(task_params)
    @task.user = current_user

    # Placeholder algorithm
    # @task.algorithm = Algorithm.first

    if @task.save
      csv_data = FileConverter.algorithm_1(@task)
      send_data csv_data, filename: task_params[:file].original_filename + "-fixed.csv", disposition: :attachment
    else
      flash[:alert] = @task.errors.full_messages
      redirect_to dashboard_path
    end

  end

  def new
  end

  private

  def task_params
    params.require(:task).permit(:file)
  end
end
