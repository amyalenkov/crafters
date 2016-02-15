class CraftersController < ApplicationController

  before_filter :authenticate_crafter!, :only => :edit; :update

  def index
    @all_crafters = Crafter.all
    @all_crafters[0].subcategory.category.id
  end

  def show
    @crafter = Crafter.find_by_id params[:id]
  end

  def update
    current_crafter.update_attributes crafters_params
    # AdminMailer.check_crafter.deliver
    # redirect_to current_crafter
  end

  def update_avatar
    crafter = params[:crafter]
    current_crafter.avatar = crafter[:avatar]
    current_crafter.save!
  end

  def update_images
    images = params[:crafter][:images]
    album = current_crafter.albums.build
    album.name = params[:album_name]
    album.description = params[:album_desc]
    images.each_with_index { |image, index|
      album_image = album.album_images.build
      if params['logo'+(index+1).to_s] == '1'
        album.logo = image
      end
      album_image.name = params['img_name'+(index+1).to_s]
      album_image.description = params['img_decs'+(index+1).to_s]
      album_image.image = image
      album_image.save!
    }
    album.save!
  end

  def get_crafters_for_category
    category = Category.find_by_name params[:name]
    @search_subcategories = Hash.new
    @search_categories = Hash.new
    @search_categories[category.id] = category.name
    @search_crafters = Array.new
    category.subcategories.each { |subcategory|
      @search_subcategories[subcategory.id] = {'name' => subcategory.name, 'category_id' => category.id}
      crafters = subcategory.crafters
      if crafters.count != 0
        crafters.each { |crafter| @search_crafters.push crafter }
      end
    }

    @cities = Array.new
    @search_crafters.each { |crafter| @cities.push crafter.city }
    @cities.uniq!
  end

  def get_crafters_for_subcategory
    subcategory = Subcategory.find_by_name params[:name]
    @subcategory_id = subcategory.id
    @search_crafters = subcategory.crafters
    @cities = Array.new
    @search_crafters.each { |crafter| @cities.push crafter.city }
  end

  def get_crafter_album
    get_album
  end

  def get_crafter_album_for_edit
    get_album
  end

  private

  def get_album
    @album = Album.find_by_id params[:album_id]
  end


  def crafters_params
    params.require(:crafter).permit(:company_name, :description, :city, :address,
                                    :phone_number, :contact_person, :site, :work_time, :subcategory_id)
  end
end
