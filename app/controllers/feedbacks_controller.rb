class FeedbacksController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  # POST /movies/:movie_id/feedbacks
  def create
    feedback = Feedback.new(feedback_params)
    feedback.user = current_user
    feedback.movie_id = params[:movie_id].to_i
    if feedback.save
      payload = {
        feedback: feedback,
        user_name: current_user.user_name
      }
      render json: payload, status: :ok
    else
      payload = {
        error: 'Invalid request',
        status: 400
      }
      render json: payload, status: :bad_request
    end
  end

  private

  def feedback_params
    params.fetch(:feedback, {}).permit(:content, :type)
  end
end
