class CraftersController < ApplicationController

  before_filter :authenticate_crafter!, :only => :edit

  def index
    @all_crafters = Crafter.all
  end

  def show
    @crafter = Crafter.find(params[:id])
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def edit
    @crafter = current_crafter
    if @crafter.id != params[:id].to_i
      redirect_to edit_crafter_path(current_crafter)
    end
    @service =  @crafter.service
    unless @service.nil?
      @category = @crafter.service.category
    end
  end
end
