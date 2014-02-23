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
      # demo hard code
      mike_device_token = "07189d1ca7b6c810059248b504aa3994c568ab04b27048ed6f7db680532710d0"
      APNS.send_notification(mike_device_token, @activity.title)
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
