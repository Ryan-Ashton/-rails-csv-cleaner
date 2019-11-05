require 'csv'
class SessionsController < ApplicationController
  
  def index

  end

  def show

  end
  
  def create
    
    @session = Session.new(session_params)
    # byebug
    @session.user = current_user

    # Placeholder algorithm
    @session.algorithm = Algorithm.first

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

    @session.save!
    # respond_to do |format|
    #   format.html { redirect_to sessions_path }
    #   format.json { render json: @session.to_json }
    # end
    respond_to do |format|
      format.json{ render :json => @session }
    end

  end

  def new
  end

  private

  def session_params
    params.permit(:file)
  end
end
