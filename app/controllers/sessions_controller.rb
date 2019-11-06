class SessionsController < ApplicationController

  def index

  end

  def show

  end

  def create

    @session = Session.new(session_params)
    @session.user = current_user

    # Placeholder algorithm
    @session.algorithm = Algorithm.first
    csv_data = FileConverter.new(session_params[:file].tempfile.path).algorithm_1


    if @session.save
      send_data csv_data, filename: "data-#{Date.today.to_s}.csv", disposition: :attachment
    else
      render :new
    end

    # respond_to do |format|
    #   format.json { render json: @session }
    # end

  end

  def new

  end

  private

  def session_params
    params.require(:session).permit(:file)
  end
end
