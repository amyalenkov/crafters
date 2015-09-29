class StaticPageController < ApplicationController
  def index
    @categories = Category.all
  end
end
