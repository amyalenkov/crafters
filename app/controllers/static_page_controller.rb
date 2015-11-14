class StaticPageController < ApplicationController
  def index
  end

  def search
    @search_crafters  = Crafter.search params[:search], :star => true, :with => {:check => true},
                                       :page => params[:page], :per_page => 42
  end

  def search_ajax
    @search_ajax_crafters  = Crafter.search params[:search], :star => true, :with => {:check => true},
                                            :page => params[:page], :per_page => 42
    render json: @search_ajax_crafters.to_json
  end

end
