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
    @task.algorithm = Algorithm.first

    # path = params["file"].tempfile


    # CSV.foreach(filepath, csv_options) do |row|
    #   puts "#{row['Name']}, a #{row['Appearance']} beer from #{row['Origin']}"
    # end

    # CSV.open(path, 'a') do |csv|
    #   csv << ['Guinness', 'Stout', 'Ireland']
    # end

    # csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    # csv_data = CSV.generate(headers: true) do |csv|
    #   CSV.open(path, 'r', :row_sep => :auto, :col_sep => ";") do |row|
    #     csv << row
    #   end
    # end

    # send_data csv_data, filename: "data-#{Date.today.to_s}.csv", disposition: :attachment

    # make the user download it

    @task.save!
    # respond_to do |format|
    #   format.html { redirect_to tasks_path }
    #   format.json { render json: @task.to_json }
    # end
    respond_to do |format|
      format.json{ render :json => @task }
    end

  end

  def new
  end

  private

  def task_params
    params.permit(:file)
  end
end
