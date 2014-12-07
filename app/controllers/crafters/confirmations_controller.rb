class Crafters::ConfirmationsController < Devise::ConfirmationsController
  def show
    super do |resource|
      sign_in(resource)
    end
  end

  private

  def after_confirmation_path_for(resource_name, resource)
    edit_crafter_path current_crafter.id
  end

end
