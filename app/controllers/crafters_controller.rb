class CraftersController < ApplicationController

  before_filter :authenticate_crafter!, :only => :edit; :update

  def index
    @all_crafters = Crafter.all
  end

  def update
    current_crafter.update_attributes crafters_params
    AdminMailer.check_crafter.deliver
    redirect_to current_crafter
  end

  def update_avatar
    crafter = params[:crafter]
    current_crafter.avatar = crafter[:avatar]
    current_crafter.save!
  end

  def update_images
    p params[:crafter][:images]
    current_crafter.images = params[:crafter][:images]
    current_crafter.save!
    render :nothing => true
  end

  private

  def crafters_params
    params.require(:crafter).permit(:company_name, :description, :city, :address,
                                    :phone_number, :contact_person, :site, :work_time)
  end
end
