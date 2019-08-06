class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :five_hundred

  def not_found
    render status: 404
  end

  def five_hundred
    render status: 500
  end
end
