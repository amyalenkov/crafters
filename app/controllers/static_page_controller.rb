class StaticPageController < ApplicationController
  def index
  end

  def search
    @search_input = params[:search]
    @search_crafters  = Crafter.search params[:search], :star => true, :with => {:check => true},
                                       :page => params[:page], :per_page => 42
    @cities = Array.new
    @search_subcategories = Hash.new
    @search_categories = Hash.new
    @search_crafters.each { |crafter|
      subcategory = Hash.new
      category = crafter.subcategory.category
      subcategory['name'] = crafter.subcategory.name
      subcategory['category_id'] = category.id
      @search_subcategories[crafter.subcategory.id] = subcategory
      @search_categories[category.id] = category.name
      @cities.push crafter.city
    }
    @search_subcategories.keys.uniq!
    @search_categories.keys.uniq!
    @cities.uniq!
  end

  def search_ajax
    @search_ajax_crafters  = Crafter.search params[:search], :star => true, :with => {:check => true},
                                            :page => params[:page], :per_page => 42
    render json: @search_ajax_crafters.to_json
  end

  def search_new_ajax
    cities = params[:cities]
    subcategories = params[:subcategories]
    @search_crafters = Crafter.search params[:search], :conditions => {:city => cities},
                                            :with => {:subcategory_id => subcategories},
                                            :star => true, :page => params[:page], :per_page => 42
  end

  def search_ajax_full
    @search_input = params[:search]
    @search_crafters  = Crafter.search params[:search], :star => true, :with => {:check => true},
                                       :page => params[:page], :per_page => 42
    @cities = Array.new
    @search_subcategories = Hash.new
    @search_categories = Hash.new
    @search_crafters.each { |crafter|
      subcategory = Hash.new
      category = crafter.subcategory.category
      subcategory['name'] = crafter.subcategory.name
      subcategory['category_id'] = category.id
      @search_subcategories[crafter.subcategory.id] = subcategory
      @search_categories[category.id] = category.name
      @cities.push crafter.city
    }
    @search_subcategories.keys.uniq!
    @search_categories.keys.uniq!
    @cities.uniq!
  end

end
