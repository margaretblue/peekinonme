class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :caregiver_name, :patient_name, :caregiver_phone, :patient_phone, :patient_email, :patient_street, :patient_city, :patient_zip, :checkintime, :patient_condition, :patient_token)
    end
end
