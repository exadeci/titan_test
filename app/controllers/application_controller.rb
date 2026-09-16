class ApplicationController < ActionController::API
  include Pagy::Method

  rescue_from Pagy::OptionError do
    render json: { error: "Invalid pagination params" }, status: :bad_request
  end
end
