class ActivitiesController < ApplicationController

  def index
    @activities = Activity.full_text_search(params[:search], allow_empty_search: true)

    render json: @activities
  end
end
