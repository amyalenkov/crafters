class Crafters::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:crafter).permit(:company_name, :email, :password, :password_confirmation,
                                    :subcategory_id)
  end

  def account_update_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :current_password,
                                    :subcategory_id)
  end
end
