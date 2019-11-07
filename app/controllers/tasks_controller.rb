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

    # case algorithm_selection
    # when task_params[:algorithm_id] = 1
    #   algo = FileConverter.algorithm_1
    # when task_params[:algorithm_id] = 2
    #   algo = FileConverter.header_spaces
    # when task_params[:algorithm_id] = 3
    #   algo = FileConverter.remove_new_lines
    # when task_params[:algorithm_id] = 4
    #   algo = FileConverter.remove_blank_columns
    # when task_params[:algorithm_id] = 5
    #   algo = FileConverter.white_space_left_right
    # when task_params[:algorithm_id] = 6
    #   algo = FileConverter.missing_random_data
    # end


    if @task.save
      csv_data = FileConverter.algorithm_1(task_params[:file].tempfile.path)
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
