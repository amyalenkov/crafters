module ApplicationHelper

  def get_subcategory_title(category_id)
    Subcategory.where(category_id: category_id).each do |subcategory|
      Rails.logger.warn 'subcategory: ' + subcategory
    end
  end

end
