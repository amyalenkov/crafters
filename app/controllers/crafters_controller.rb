class CraftersController < ApplicationController

  before_filter :authenticate_crafter!, :only => :edit; :update

  def index
    @all_crafters = Crafter.all
  end

  def show
    @crafter = Crafter.find(params[:id])
  end

  def edit
    @crafter = current_crafter
  end

  def update
    @crafter = current_crafter
    @crafter.update_attributes crafters_params
    AdminMailer.check_crafter(@crafter).deliver
    redirect_to current_crafter
  end

  private

  def crafters_params
    params.require(:crafter).permit(:company_name, :description, :city, :address,
                                    :phone_number, :contact_person, :site, :work_time)
  end
end
