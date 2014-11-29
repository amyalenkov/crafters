class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    super do |resource|
      sign_in(resource)
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    current_user
  end

end
