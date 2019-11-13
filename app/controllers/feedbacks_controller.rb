class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit]

  def create
    @feedback = Feedback.new(feedback_params)
    @task = Task.find(params[:task_id])
    @feedback.task = @task
    if @feedback.save
      flash[:success] = "Thank you for your feedback!"
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_to dashboard_path
  end

  def show
  end

  def index
    @feedbacks = Feedback.all
  end

  def edit
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
