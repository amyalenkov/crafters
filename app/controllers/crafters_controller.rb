class CraftersController < ApplicationController

  before_filter :authenticate_crafter!, :only => :edit; :update

  def index
    @all_crafters = Crafter.all
    crafter = Crafter.first
    crafter.albums.album_images.image
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
    images = params[:crafter][:images]
    album = current_crafter.albums.build
    album.logo = images[0]
    album.name = params[:album_name]
    album.description = params[:album_desc]
    images.each_with_index { |image, index|
      album_image = album.album_images.build
      album_image.name = params['img_name'+(index+1).to_s]
      album_image.description = params['img_decs'+(index+1).to_s]
      album_image.image = image
      album_image.save!
    }
    album.save!
    render :nothing => true
  end

  private

  def crafters_params
    params.require(:crafter).permit(:company_name, :description, :city, :address,
                                    :phone_number, :contact_person, :site, :work_time)
  end
end
