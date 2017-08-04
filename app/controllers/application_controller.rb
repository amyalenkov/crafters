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

  def get_all_crafters_and_users
    result_hash = Hash.new
    result_hash['crafters'] = Crafter.all
    result_hash['users'] = User.all
    render :json => result_hash.to_json
  end

  private

  def get_all_categories_subcategories
    @categories = Category.includes :subcategories
    @menu_hash = Hash.new
    @categories.each do |category|
      @menu_hash.store category, category.subcategories
    end
  end

end