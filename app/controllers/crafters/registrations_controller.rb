class Crafters::RegistrationsController < Devise::RegistrationsController



  private

  def sign_up_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :description, :subcategory_id)
  end

  def account_update_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :current_password,
                                    :description, :subcategory_id)
  end
end
