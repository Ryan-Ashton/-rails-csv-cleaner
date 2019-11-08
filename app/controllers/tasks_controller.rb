class TasksController < ApplicationController
  def index

  end

  def show

  end

  def create
    @task = Task.new

    # byebug
    @algorithm = Algorithm.find(params[:task][:algorithm])
    @task.algorithm = @algorithm
    @task.file = params[:task][:file]
    @task.user = current_user
    
    # Placeholder algorithm
    # @task.algorithm = Algorithm.first

    if @task.save
      csv_data = nil

      if @task.algorithm_id == 1
        csv_data = FileConverter.algorithm_1(@task.file)  
      elsif @task.algorithm_id == 2
        csv_data = FileConverter.header_spaces(@task.file)
      elsif @task.algorithm_id == 3
        csv_data = FileConverter.remove_new_lines(@task.file)
      elsif @task.algorithm_id == 4
        csv_data = FileConverter.remove_blank_columns(@task.file)
      elsif @task.algorithm_id == 5
        csv_data = FileConverter.white_space_left_right(@task.file)
      elsif @task.algorithm_id == 6
        csv_data = FileConverter.missing_random_data(@task.file)
      end

      send_data csv_data, filename: params[:task][:file].original_filename + "-fixed.csv", disposition: :attachment
    else
      flash[:alert] = @task.errors.full_messages
      redirect_to dashboard_path
    end

  end

  def new
  end

  private

  def task_params
    params.require(:task).permit()
  end
end
