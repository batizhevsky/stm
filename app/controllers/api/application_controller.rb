class Api::ApplicationController < ApplicationController
  include AuthHelper

  # skip_before_filter :verify_authenticity_token
  respond_to :json
end
