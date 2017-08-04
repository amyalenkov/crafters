class Crafters::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:crafter).permit(:company_name, :email, :site, :city, :address,
                                    :phone_number, :description, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :current_password)
  end
end
