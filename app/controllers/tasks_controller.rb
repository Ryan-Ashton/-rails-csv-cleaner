require 'byebug'

class TasksController < ApplicationController
  def index

  end

  def show

  end

  def create
    @task = Task.new
    @algorithm = Algorithm.find(params[:task][:algorithm])
    @task.algorithm = @algorithm
    @task.file = params[:task][:file]
    @task.user = current_user
    @task.filesize = params[:task][:file].tempfile.size.fdiv(1024).round(2)
    @task.title = params[:task][:file].original_filename # Ryan Attempt


    if @task.save
      csv_data = nil


      if @task.algorithm_id == 1
        csv_data = FileConverter.new(@task.file).missing_random_data
      elsif @task.algorithm_id == 2
        csv_data = FileConverter.new(@task.file).header_spaces
      elsif @task.algorithm_id == 3
        csv_data = FileConverter.new(@task.file).remove_new_lines
      elsif @task.algorithm_id == 4
        csv_data = FileConverter.new(@task.file).remove_symbols
      elsif @task.algorithm_id == 5
        csv_data = FileConverter.new(@task.file).white_space_left_right
      elsif @task.algorithm_id == 6
        csv_data = FileConverter.new(@task.file).remove_blank_columns
      elsif @task.algorithm_id == 7
        csv_data = FileConverter.new(@task.file).over_under
      elsif @task.algorithm_id == 8
        csv_data = FileConverter.new(@task.file).shared_column
      end

      if csv_data == false
        flash[:alert] = "Error while processing file."
        redirect_to root_path
      else
        @task.file.purge
        @task.file.attach(io: csv_data, filename: params[:task][:file].original_filename + "-fixed.csv", content_type: "text/csv")
        csv_data.close
        flash[:success] = "File conversion successful."
        redirect_to dashboard_path
        # send_data csv_data, filename: params[:task][:file].original_filename + "-fixed.csv", disposition: :attachment
      end

    else
      flash[:alert] = @task.errors.full_messages
      redirect_to root_path
    end

  end

  def new
  end

  def download
    @task = Task.find(params[:id])
    @task.downloaded = true
    @task.save
    send_data @task.file.blob.download, filename: @task.file.blob.filename.to_s, disposition: :attachment
  end

  # def task_params
  #   params.require(:task).permit(:file)
  # end
end
