require 'spec_helper'

# Stub ApiController
# get :index to test
class TestApiController < Api::V1::ApiController
  def index
    render nothing: true
  end

  test_routes = Proc.new do
      get '/index' => 'test_api#index'
  end
  Rails.application.routes.eval_block(test_routes)
end

describe TestApiController do
end
