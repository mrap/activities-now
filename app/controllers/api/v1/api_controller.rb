class Api::V1::ApiController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :json

  def raise_bad_request_error
    render nothing: true, status: :bad_request and return
  end

  def raise_not_authorized_error
    render nothing: true, status: :unauthorized and return
  end

  def raise_not_found_error
    render nothing: true, status: :not_found and return
  end

end
