class CraftersController < ApplicationController
  def index
  end

  def show
    @crafter = Crafter.find(params[:id])
  end
end
