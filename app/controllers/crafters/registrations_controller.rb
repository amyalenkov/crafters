class Crafters::RegistrationsController < Devise::RegistrationsController



  private

  def sign_up_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :description, :service_id)
  end

  def account_update_params
    params.require(:crafter).permit(:email, :password, :password_confirmation, :current_password,
                                    :description, :service_id)
  end
end
