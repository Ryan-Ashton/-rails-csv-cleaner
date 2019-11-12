class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    #@files_counter = Task.all.length

  end

  def about

  end
  
  def dashboard
    @task = Task.new
  end

end
