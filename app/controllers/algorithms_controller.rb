class AlgorithmsController < ApplicationController
  def index
    @algorithms = Algorithm.all
  end

  def show
    @algorithm = Algorithm.find(params[:id])
  end

  def new
    
  end
end
