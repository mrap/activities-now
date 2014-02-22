class ApplicationController < ActionController::Base
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

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  #
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  #       # If this is a preflight OPTIONS request, then short-circuit the
  #       # request, return only the necessary headers and return an empty
  #       # text/plain.
  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
end
