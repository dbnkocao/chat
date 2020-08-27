class RegistrationController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
# end
