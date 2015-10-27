require 'json'
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :get_all_categories_subcategories

  def get_subcategory
    result_hash = Hash.new
    Subcategory.where(category_id: params[:category_id]).each do |subcategory|
      result_hash.store subcategory.id, subcategory.name
    end
    render :json => result_hash.to_json
  end

  def search
    # @search_crafters =  Crafter.search params[:search], :page => params[:page], :per_page => 1
    @search_crafters  = Crafter.search '1', :page => params[:page], :per_page => 42
    render '/static_page/search'
  end

  private
  def get_all_categories_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
