class User::ParameterSanitizer < Devise::ParameterSanitizer
  private
  def account_update
    default_params.permit(:name, :phone, :street, :city, :zip, :condition,:checkintime)
  end
end
