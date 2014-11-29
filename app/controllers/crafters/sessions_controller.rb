class Crafters::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    current_crafter
  end

end
