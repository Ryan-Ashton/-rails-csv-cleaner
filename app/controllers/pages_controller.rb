class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @files_counter = Task.all.length
    @task = Task.new
    if current_user
      if current_user.tasks.last
        current_user.tasks.last.file.purge
      end
    end
  end

  def dashboard
    @task = current_user.tasks.last
    @user_tasks = current_user.tasks
  end
end
