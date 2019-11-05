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

    @session.save!
    raise
  end

  def new
  end

  private

  def session_params
    params.require(:session).permit(:file)
  end
end
