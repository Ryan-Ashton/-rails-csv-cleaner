class TasksController < ApplicationController
  def index

  end

  def show

  end

  def create

    @task = Task.new(task_params)
    # byebug
    @algorithm = Algorithm.find(params[:algorithm_id])
    @task.algorithm = @algorithm
    @task.user = current_user
    
    # Placeholder algorithm
    # @task.algorithm = Algorithm.first

    if @task.save
      csv_data = nil

      if @task.algorithm_id == 1
        csv_data = FileConverter.algorithm_1(params[:task][:file].tempfile.path)  
      elsif @task.algorithm_id == 2
        csv_data = FileConverter.header_spaces(params[:task][:file].tempfile.path)
      elsif @task.algorithm_id == 3
        csv_data = FileConverter.remove_new_lines(params[:task][:file].tempfile.path)
      elsif @task.algorithm_id == 4
        csv_data = FileConverter.remove_blank_columns(params[:task][:file].tempfile.path)
      elsif @task.algorithm_id == 5
        csv_data = FileConverter.white_space_left_right(params[:task][:file].tempfile.path)
      elsif @task.algorithm_id == 6
        csv_data = FileConverter.missing_random_data(params[:task][:file].tempfile.path)
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
