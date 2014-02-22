class ActivitiesController < ApplicationController

  def index
    @activities = Activity.full_text_search(params[:search], allow_empty_search: true)

    render json: @activities
  end

  def show
    @activity = Activity.find(params[:id])
    render json: @activity
  end

  def create
    if @activity = Activity.create(activity_params)
      render json: @activity
    else
      render json: { errors: @activity.errors }, status: :bad_request
    end
  end

  private

    def activity_params
      params.require(:activity).permit(:title, :tags)
    end
end
