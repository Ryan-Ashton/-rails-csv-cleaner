class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @files_counter = Task.all.length
    @task = Task.new
  end

  def dashboard
    @task = current_user.tasks.last
    @user_tasks = current_user.tasks
    @feedback = Feedback.new
    # @file_sizes = @user_tasks.map { |task| task.input_file_size } Ray Han
    @file_sizes = @user_tasks.map { |task| task.filesize } #Ryan attempt
    @file_names = @user_tasks.map { |task| task.title }
    @data_loaded = @user_tasks.group_by { |task| task.created_at.strftime("%d %b") }.map { |key, value| { "#{key}": value.count  } }
    @tasks_count = @user_tasks.group_by { |task| task.created_at.strftime("%d %b") }.map { |key, value| value.count }
    @algorithm_used =  @user_tasks.group_by { |task| task.algorithm.name }.map { |key, value| { "#{key}": value.count } }
  end
end
