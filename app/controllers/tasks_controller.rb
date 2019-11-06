class TasksController < ApplicationController
  def index

  end

  def show

  end

  def create

    @task = Task.new(task_params)
    # byebug
    @task.user = current_user

    # Placeholder algorithm
    # @task.algorithm = Algorithm.first
    csv_data = FileConverter.new(task_params[:file].tempfile.path).algorithm_1

    if @task.save
      send_data csv_data, filename: "data-#{Date.today.to_s}.csv", disposition: :attachment
    else
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
