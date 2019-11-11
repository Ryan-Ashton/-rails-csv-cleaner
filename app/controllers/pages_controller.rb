class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @files_counter = Task.all.length
    @task = Task.new
  end

  def dashboard
    @task = current_user.tasks.last
  end
end
