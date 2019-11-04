class FeedbacksController < ApplicationController

  before_action :set_feedback, only: [:show, :edit]


  def new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def index
    @feedbacks = Feedback.all
  end

  def edit
  end

  private
  def feedback_params
    params.require(:feedback).permit(:rating, :comments)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

end
