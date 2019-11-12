class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @files_counter = Task.all.length
    @task = Task.new
  end


  def dashboard
    @task = current_user.tasks.last
    @user_tasks = current_user.tasks
  end
end
