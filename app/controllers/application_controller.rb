require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_services
    result_hash = Hash.new
    Service.where(category_id: params[:category_id]).each do |servise|
      result_hash.store servise.id, servise.name
    end
    render :json => result_hash.to_json
  end

end
