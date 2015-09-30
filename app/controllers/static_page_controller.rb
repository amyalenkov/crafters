class StaticPageController < ApplicationController
  def index
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
